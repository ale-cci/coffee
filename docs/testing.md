# Test Unitari (Testing)

Coffee-lang dispone di un framework di unit testing nativo integrato nella libreria standard all'indirizzo `std/testing`. Questo modulo permette di catturare l'output dei test, convalidare il comportamento del codice tramite asserzioni e generare report colorati per il terminale.

---

## Struttura di un File di Test

I file di test in Coffee-lang hanno solitamente l'estensione `.test.bn` e definiscono una funzione `main()` che coordina l'esecuzione della suite di test.

### Esempio Completo (`mio_modulo.test.bn`):

```go
import "./std/io" as io
import "./std/testing" as testing
import "./mio_modulo" as mio -- Modulo da testare

int main() {
    -- Inizializza la suite di test indicando il nome del file o del modulo
    t := testing.init("mio_modulo.test.bn")

    -- Configura ed esegue il primo caso di test
    testing.setup(t, "somma due numeri correttamente")
    testing.run(t, test_somma_due_numeri(t))

    -- Configura ed esegue un altro caso di test
    testing.setup(t, "convalida una stringa")
    testing.run(t, test_verifica_stringa(t))

    -- Esegue la pulizia delle risorse allocate per il test
    testing.cleanup(t)
    return 0
}

int test_somma_due_numeri(testing.T* t) {
    risultato := mio.somma(2, 3)
    testing.assert_equal_int(t, 5, risultato)
    return 0
}

int test_verifica_stringa(testing.T* t) {
    testo := mio.genera_testo()
    testing.assert_equal_str(t, "valore_atteso", testo)
    return 0
}
```

---

## Ciclo di Vita del Test

1. **`testing.init(chr* filename) -> T*`**: Alloca e inizializza la struttura dati `T` della suite di test, tenendo traccia del file in esecuzione e dei descrittori di file.
2. **`testing.setup(T* t, chr* test_name)`**: Prepara il singolo caso di test (`test_name`). Sotto la scocca, ridirige temporaneamente lo standard output del test in una pipe per isolare ed eventualmente raccogliere eventuali log o stampe impreviste del codice sotto test.
3. **`testing.run(T* t, int _unused)`**: Conclude il caso di test, ripristina i descrittori di file e stampa l'esito sul terminale:
   * `[ OK ]` in verde se tutte le asserzioni sono passate.
   * `[ ERROR ]` in rosso se una o più asserzioni sono fallite, stampando anche il dettaglio delle asserzioni fallite catturate dalla pipe.
   * `[ WARN ]` in giallo se il test è terminato senza incontrare alcuna asserzione.
4. **`testing.cleanup(T* t)`**: Esegue la deallocazione della memoria e chiude tutti i descrittori di file rimasti aperti.

---

## Asserzioni Disponibili

Il framework mette a disposizione diverse funzioni di asserzione per validare differenti tipi di dati e condizioni:

| Funzione di Asserzione | Descrizione |
|------------------------|-------------|
| `assert_equal_int(T* t, int expect, got)` | Verifica che due valori interi siano uguali. |
| `assert_equal_chr(T* t, chr expect, got)` | Verifica che due caratteri siano uguali. |
| `assert_equal_str(T* t, chr* expect, got)` | Verifica che due stringhe siano identiche. |
| `assert_contains_str(T* t, chr* haystack, needle)` | Verifica che la stringa `haystack` contenga la sottostringa `needle`. |
| `assert_true(T* t, chr* label, bool val)` | Verifica che una condizione booleana `val` sia vera (stampa `label` in caso di errore). |
| `assert_false(T* t, chr* label, bool val)` | Verifica che una condizione booleana `val` sia falsa (stampa `label` in caso di errore). |
| `assert_null(T* t, chr* ptr)` | Verifica che un puntatore `ptr` sia nullo (`null`). |
| `assert_not_null(T* t, chr* ptr)` | Verifica che un puntatore `ptr` **non** sia nullo. |
