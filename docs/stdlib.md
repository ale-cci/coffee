# Libreria Standard (Stdlib)

Coffee-lang fornisce una serie di moduli predefiniti nella sua libreria standard (`src/std/`). Questi moduli agiscono principalmente come wrapper ad alte prestazioni per le chiamate di sistema POSIX e le funzioni della libreria standard C (`libc`), rendendo semplice la manipolazione di I/O, memoria, stringhe, processi e socket.

---

## Moduli Principali

* [`std/io`](#stdio) — Operazioni di Input/Output (formattato e di sistema).
* [`std/ioutil`](#stdioutil) — Funzioni di utilità per la lettura e copia di file descriptor.
* [`std/sys`](#stdsys) — Gestione della memoria dinamica, processi POSIX e asserzioni.
* [`std/string`](#stdstring) — Manipolazione di stringhe e classificazione di caratteri.
* [`std/net`](#stdnet) — Programmazione di rete tramite socket di sistema.

---

<a name="stdio"></a>
## `std/io` — Input/Output

Fornisce le funzioni standard di lettura e scrittura, inclusi i wrapper per le funzioni di formattazione di `libc`.

### Descrittori Standard:
* `io.STDIN` (0) — Standard Input.
* `io.STDOUT` (1) — Standard Output.
* `io.STDERR` (2) — Standard Error.

### Funzioni Principali:
* **`printf(str format, ...args) -> int`**: Stampa testo formattato su standard output (supporta argomenti variadici).
* **`sprintf(chr* dest, str format, ...args) -> int`**: Scrive testo formattato all'interno di un buffer di caratteri `dest`.
* **`snprintf(chr* dest, int size, str format, ...args) -> int`**: Simile a `sprintf`, ma limita la scrittura al numero massimo di byte specificato da `size`.
* **`asprintf(chr** string_pointer, str format, ...args) -> int`**: Alloca dinamicamente una stringa formattata sufficientemente grande da contenere l'output e ne assegna l'indirizzo a `string_pointer`.
* **`puts(str text) -> int`**: Scrive una stringa seguita da un carattere newline (`\n`) su standard output.
* **`scanf(str template, ...args) -> int`**: Legge dati formattati dallo standard input.
* **`write(int fd, str buffer, int n) -> int`**: Chiamata di sistema (`write`) a basso livello per scrivere `n` byte da `buffer` nel file descriptor `fd`.
* **`read(int fd, chr* buf, int bytes_to_read) -> int`**: Chiamata di sistema (`read`) a basso livello per leggere fino a `bytes_to_read` nel buffer `buf`.
* **`close(int fd) -> int`**: Chiude il file descriptor `fd`.

---

<a name="stdioutil"></a>
## `std/ioutil` — Utility I/O

Contiene funzioni comode di astrazione di alto livello per operazioni comuni di lettura.

### Funzioni Principali:
* **`readall(int fd) -> str`**: Legge in modo iterativo l'intero contenuto del file descriptor `fd` fino al raggiungimento di EOF (End-Of-File) e restituisce il risultato sotto forma di stringa dinamica.
* **`copy(int from_fd, int to_fd) -> int`**: Legge tutti i dati provenienti dal descrittore `from_fd` e li scrive integralmente in `to_fd`.

---

<a name="stdsys"></a>
## `std/sys` — Sistema e Memoria

Fornisce l'accesso alle chiamate del sistema operativo per la gestione del ciclo di vita del processo, allocazione della memoria dinamica e utilità di sistema.

### Funzioni Principali:
* **`malloc(int size) -> chr*`**: Alloca un blocco di memoria dinamica (heap) di dimensione `size` byte e restituisce un puntatore ad esso.
* **`realloc(chr* ptr, int size) -> chr*`**: Ridimensiona l'area di memoria precedentemente allocata e puntata da `ptr` alla nuova dimensione `size`.
* **`free(chr* ptr)`**: Rilascia la memoria dinamica precedentemente allocata con `malloc` o `realloc`.
* **`exit(int status_code)`**: Termina immediatamente l'esecuzione del processo restituendo il codice di stato `status_code` al sistema operativo.
* **`assert(bool condition, str message)`**: Se `condition` è falsa, stampa il messaggio di errore su standard output ed esegue `exit(1)`, interrompendo il programma.
* **`fork() -> int`**: Crea un processo figlio sdoppiando il processo corrente (chiamata POSIX `fork`).
* **`waitpid(int pid, int* stat_loc, int options) -> int`**: Sospende l'esecuzione del processo chiamante finché il processo figlio specificato da `pid` non ha cambiato stato.
* **`memset(chr* buf, chr val, int n) -> chr*`**: Imposta i primi `n` byte dell'area di memoria puntata da `buf` al valore `val`.
* **`memmove(chr* dest, chr* src, int n) -> chr*`**: Copia `n` byte dall'area di memoria `src` all'area `dest` (sicuro anche in caso di aree sovrapposte).

---

<a name="stdstring"></a>
## `std/string` — Stringhe e Caratteri

Fornisce funzioni per il confronto e la manipolazione delle stringhe in stile C (null-terminated), oltre a predicati sui singoli caratteri.

### Funzioni Principali:
* **`strcmp(chr* str1, chr* str2) -> int`**: Confronta due stringhe carattere per carattere. Restituisce `0` se sono identiche, `< 0` se `str1` precede `str2` in ordine lessicografico, e `> 0` altrimenti.
* **`strncmp(chr* str1, chr* str2, int n) -> int`**: Simile a `strcmp`, ma limita il confronto ai primi `n` caratteri.
* **`strlen(str message) -> int`**: Restituisce la lunghezza di una stringa (escludendo il carattere terminatore nullo `\0`).
* **`strcat(chr* dest, chr* src) -> chr*`**: Concatena la stringa `src` alla fine di `dest`.
* **`is_letter(chr c) -> bool`**: Restituisce `true` se il carattere `c` è una lettera dell'alfabeto (maiuscola o minuscola).
* **`is_digit(chr c) -> bool`**: Restituisce `true` se `c` è una cifra numerica (`0-9`).
* **`is_whitespace(chr c) -> bool`**: Restituisce `true` se `c` è uno spazio o un carattere di tabulazione.

---

<a name="stdnet"></a>
## `std/net` — Programmazione di Rete

Espone le chiamate di base per creare ed interagire con i socket POSIX di comunicazione.

### Funzioni Principali:
* **`socket(int domain, int type, int protocol) -> int`**: Crea un socket per le comunicazioni di rete o inter-processo e restituisce il file descriptor associato.
