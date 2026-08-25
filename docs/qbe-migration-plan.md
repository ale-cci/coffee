# Piano di Migrazione verso QBE (Quick Backend)

> **Per gli agenti AI:** Questo piano definisce i compiti specifici per migrare il backend del compilatore Coffee-lang da LLVM a QBE. Utilizza la sintassi dei checkbox (`- [ ]`) per tracciare lo stato di avanzamento.

**Obiettivo:** Rimpiazzare LLVM con QBE come backend di compilazione, integrando QBE come risorsa leggera incorporata nel progetto, azzerando le dipendenze esterne pesanti e velocizzando le build.

**Architettura:** Sostituzione dell'emissione di codice LLVM IR con codice QBE SSA IR. Aggiornamento dei generatori di tipi (`lang_types.bn`), della sintassi di emissione delle espressioni (`init.bn`) e automazione della migrazione dei test di snapshot tramite aggiornamento automatico dei file `.out`.

**Stack Tecnologico:** Coffee-lang (sintassi `.bn`), QBE SSA IR (Quick Backend).

---

## 1. Mappa dei File Coinvolti

| File | Stato | Responsabilità nella Migrazione |
|:---|:---:|:---|
| `src/std/compile/lang_types.bn` | Modificare | Mappare i tipi Coffee-lang (`int`, `chr`, `bool`, puntatori, struct) nei tipi nativi QBE (`w`, `l`, `b`, `:struct`). |
| `src/std/compile/init.bn` | Modificare | Riscrittura della generazione delle istruzioni (passata Deep) da sintassi LLVM a sintassi QBE IR (es. `call`, `ret`, rami condizionali, salti). |
| `src/std/compile/llvm.bn` | Sostituire con `qbe.bn` | Convertire la codifica dei letterali stringa e carattere per i blocchi dati QBE. |
| `src/main.bn` | Modificare | Cambiare l'invocazione di pipeline: da `llc` a `qbe`, convogliando l'assembly finale a `cc`. |
| `src/std/compile/init.test.bn` | Modificare | Integrare una modalità di aggiornamento automatico degli snapshot (es. tramite variabile d'ambiente `UPDATE_SNAPSHOTS=1`) per rigenerare tutti i file `.out` in blocco. |
| `src/std/compile/__test__/*.out` | Aggiornare | Sostituire il codice atteso (attualmente LLVM IR) con il codice QBE SSA IR. |

---

## Fase 1: Riorganizzazione dei Tipi (QBE Types)

### Task 1: Modifica di `lang_types.bn`
* **File da modificare:** `src/std/compile/lang_types.bn`
* **Obiettivo**: Convertire la funzione `repr(...)` per ritornare le abbreviazioni dei tipi di QBE:
  * `int` -> `w` (32-bit word)
  * `chr` -> `b` (8-bit byte)
  * `bool` -> `w` (in QBE le condizioni booleane e i confronti usano word da 32-bit)
  * `void` -> (in QBE non esiste un tipo void esplicito per le variabili, ma per i tipi di ritorno delle funzioni si omette il tipo)
  * Puntatori (`*`) -> `l` (64-bit long su architetture a 64 bit)
  * Struct -> `:NomeStruct` (le strutture in QBE sono definite a livello globale con la sintassi `type :NomeStruct = { ... }`)

- [ ] **Step 1:** Modificare la funzione `repr` in `lang_types.bn` per mappare i tipi base secondo le specifiche di QBE.
- [ ] **Step 2:** Aggiungere il supporto alla generazione delle definizioni di tipo globali per le struct in QBE: `type :nome = { w 2, l 1 }`.
- [ ] **Step 3:** Scrivere un test unitario isolato in `src/std/compile/lang_types.bn` per verificare la corretta restituzione dei tipi QBE.

---

## Fase 2: Conversione del Generatore di Codice (Code Gen)

### Task 2: Modifica della sintassi delle funzioni ed extern in `init.bn`
* **File da modificare:** `src/std/compile/init.bn`
* **Obiettivo**: Adattare le intestazioni delle funzioni alla sintassi QBE.
  * *LLVM*: `define i32 @main(i32 %argc) {`
  * *QBE*: `export function w $main(w %argc) {`
  * Le funzioni esterne in QBE non richiedono una dichiarazione `declare` esplicita all'inizio del file; basta effettuare la chiamata diretta anteponendo il simbolo `$` (es. `call $printf(...)`).

- [ ] **Step 1:** Riscrivere la sezione di `compile_statement` che gestisce `extern`, rimuovendo l'emissione del blocco `declare` LLVM (in QBE non è necessario).
- [ ] **Step 2:** Modificare la generazione dell'intestazione di `function` in `compile_statement` per emettere `export function <tipo> $<nome>(...) {`. Note: in QBE i nomi globali iniziano con `$` e quelli locali con `%`.
- [ ] **Step 3:** Riscrivere la chiusura dei blocchi delle funzioni emettendo la graffa `}` di chiusura standard.

### Task 3: Generazione di Espressioni e Istruzioni SSA in `init.bn`
* **File da modificare:** `src/std/compile/init.bn` e `shunting_yard.bn`
* **Obiettivo**: Convertire le istruzioni LLVM in istruzioni QBE a tre indirizzi.
  * *LLVM*: `%t1 = add i32 %a, %b`
  * *QBE*: `%t1 =w add %a, %b` (nota che l'operatore include la lettera del tipo, ad esempio `add` con tipo word `w` diventa `=w add`).
  * Mappare le istruzioni di Load e Store:
    * *LLVM*: `%t = load i32, i32* %ptr`
    * *QBE*: `%t =w loadw %ptr`
    * *LLVM*: `store i32 %val, i32* %ptr`
    * *QBE*: `storew %val, %ptr`

- [ ] **Step 1:** Modificare l'emissione dell'assegnamento delle espressioni in `compile_expression` includendo il tipo QBE nell'operatore (es. `=w add`, `=l add`).
- [ ] **Step 2:** Modificare la generazione di `load` e `store` per adeguarla ai comandi `loadw`, `loadl`, `loadb` e `storew`, `storel`, `storeb` di QBE.
- [ ] **Step 3:** Convertire la gestione dei rami condizionali (`compile_if_block` e `compile_for_loop`) per usare le istruzioni di salto QBE:
  * QBE usa `jnz %cond, @label_true, @label_false` per i salti condizionali e `jmp @label` per i salti incondizionati.

---

## Fase 3: Pipeline di Compilazione ed Integrazione di Sistema

### Task 4: Modifica di `main.bn` e del processo di Bootstrapping
* **File da modificare:** `src/main.bn` e `install.sh`
* **Obiettivo**: Integrare l'eseguibile `qbe` come backend.
  * Invece di invocare `llc - -o debug.s`, la pipeline invocherà `qbe -o debug.s`.
  * L'output assembly generato da QBE (`.s`) verrà poi compilato ed assemblato da `cc` esattamente come prima.

- [ ] **Step 1:** Modificare la funzione `compile_file` in `src/main.bn` sostituendo la riga di comando `llc` con `qbe`.
- [ ] **Step 2:** Integrare il codice sorgente di QBE (o una sua versione precompilata leggera) all'interno di `install.sh` in modo che venga compilata ed installata automaticamente in `~/.coffee/bin/qbe` se non presente nel sistema.

---

## Fase 4: Automazione della Migrazione dei Test (Strategia Snapshot)

Abbiamo oltre 70 test di compilazione in `src/std/compile/__test__/` che convalidano il codice generato confrontandolo con i file `.out`. Effettuare la migrazione manuale di 70 file `.out` richiederebbe giorni. Automatizzeremo il processo.

### Task 5: Aggiornamento di `init.test.bn` con meccanismo di "Auto-Update"
* **File da modificare:** `src/std/compile/init.test.bn`
* **Obiettivo**: Aggiungere un flag o variabile d'ambiente (es. `UPDATE_SNAPSHOTS=1`) che, se abilitata, sovrascrive automaticamente i file `.out` con il nuovo output QBE generato.

- [ ] **Step 1:** Modificare la funzione `testfile` in `init.test.bn` per leggere una variabile di ambiente (o un parametro globale):
  ```go
  -- pseudocodice in Coffee-lang
  update_snapshots := sys.getenv("UPDATE_SNAPSHOTS")
  if update_snapshots != null {
      -- Sovrascrivi il file .out con il valore di 'got'
      out_filename := ""
      io.asprintf(&out_filename, "%s.out", filename)
      f := io.fopen(out_filename, "w")
      io.fwrite(got, 1, string.strlen(got), f)
      io.fclose(f)
  }
  ```
- [ ] **Step 2:** Eseguire la suite di test con la variabile abilitata per rigenerare tutti i file `.out` istantaneamente una volta completato lo sviluppo dei Task 1-3.
- [ ] **Step 3:** Eseguire un controllo `git diff` per verificare visivamente la correttezza formale dell'IR di QBE generato in tutti i test e committare le modifiche.

---

## Punti di Controllo e Validazione

1. **Test Singolo**: Provare a migrare e far passare il test `01-empty_main.in` come primo prototipo per verificare la pipeline.
2. **Bootstrapping completo**: Compilare il compilatore stesso con il nuovo backend QBE ed assicurarsi che sia in grado di auto-compilarsi (self-hosting).
3. **Esecuzione di tutti i test**: Rigenerare tutti gli snapshot ed assicurarsi che la suite `init.test.bn` riporti `[ OK ]` per tutti e 70+ i test.
