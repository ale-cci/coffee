# Strutture (Struct)

Le strutture (`struct`) consentono di raggruppare variabili di tipo diverso sotto un unico nome. Coffee-lang supporta sia la definizione di strutture anonime locali, sia la creazione di tipi strutturati tramite la parola chiave `alias`.

---

## Definizione di una Struct

La sintassi generale per definire una struttura è la seguente:

```go
struct {
    <tipo> <nome_campo>,
    <tipo> <altro_campo>,
} <nome_variabile>
```

Ogni campo deve essere separato da una virgola `,`, compreso l'ultimo campo prima della chiusura della parentesi graffa.

### Esempio di Struct Anonima Locale
Puoi definire e istanziare una struttura direttamente all'interno di una funzione:

```go
void main() {
    struct {
        int x,
        int y,
    } punto

    punto.x = 10
    punto.y = 20
}
```

---

## Associazione con `alias` (Tipi Nominati)

Per riutilizzare una struttura o passarla come parametro alle funzioni, si usa la parola chiave `alias`. Questo definisce un nuovo tipo di dato a tutti gli effetti.

### Sintassi:
```go
alias <NomeTipo> = struct {
    <tipo> <nome_campo>,
    -- ...
}
```

### Esempio:
```go
alias Persona = struct {
    str nome,
    int eta,
}

void saluta(Persona p) {
    -- logica
}

void main() {
    Persona utente
    utente.nome = "Mario"
    utente.eta = 30
}
```

---

## Puntatori a Struct e Risoluzione Automatica

Coffee-lang gestisce i puntatori alle strutture in modo estremamente pulito, ispirandosi a **Go**. 

Quando si ha un puntatore a una struttura, non è necessario utilizzare un operatore di dereferenziazione specifico (come `->` in C). Il compilatore risolve automaticamente i campi tramite il semplice operatore punto `.`.

### Esempio:
```go
alias Rettangolo = struct {
    int larghezza,
    int altezza,
}

int calcola_area(Rettangolo* r) {
    -- Anche se 'r' è un puntatore (Rettangolo*), usiamo il punto '.'
    return r.larghezza * r.altezza
}

void main() {
    Rettangolo rect
    rect.larghezza = 5
    rect.altezza = 10

    -- Passiamo l'indirizzo della struct tramite l'operatore '&'
    area := calcola_area(&rect)
}
```
