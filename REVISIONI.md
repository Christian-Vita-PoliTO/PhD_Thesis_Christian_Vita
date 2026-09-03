# Come segnalare le revisioni

Il modo più efficiente per lavorare sulla tesi insieme a Claude: le richieste si
scrivono **dentro il sorgente LaTeX**, nel punto esatto a cui si riferiscono, come
commenti con un marcatore. Poi si fa push e Claude le raccoglie tutte.

> **Attenzione:** i commenti di Overleaf (quelli nella barra laterale) e il
> track-changes **non finiscono su GitHub**: restano nel database di Overleaf.
> Claude vede solo il contenuto dei file `.tex`. Quindi le note vanno scritte
> come commenti LaTeX, non come commenti Overleaf.

## I quattro marcatori

Si scrivono sulla riga sopra il punto interessato (o alla fine del paragrafo).

    % CV: riscrivi questo paragrafo, troppo lungo
    % CV?: questo numero da dove viene?
    % CV-CUT: questa parte la togliamo
    % CV+: qui va approfondito, manca il legame con il capitolo 6

- `% CV:` **fai**. Modifica richiesta, procedi.
- `% CV?:` **rispondi prima**. Domanda o dubbio: Claude risponde e non tocca il
  testo finché non c'è una decisione.
- `% CV-CUT:` **togli**. Da rimuovere (Claude chiede conferma solo se il taglio
  trascina con sé figure, numeri o riferimenti usati altrove).
- `% CV+:` **espandi**. Serve più sostanza; se richiede dati che non ci sono,
  Claude lo dice invece di inventarli.

Il testo dopo il marcatore è libero: più è specifico, meno giri si fanno.

## Il giro di lavoro

1. Leggi il PDF, e ogni volta che vuoi qualcosa scrivi il marcatore nel `.tex`
   (da Overleaf o da VS Code, indifferente).
2. Push. Se lavori in Overleaf, spingi su GitHub prima di passare la palla.
3. Dici a Claude «ho lasciato dei marcatori». Claude fa `git pull`, li raccoglie
   tutti con `marks.cmd`, e lavora.
4. Ogni marcatore diventa **un commit separato**, con in messaggio cosa è stato
   fatto e perché. Così puoi rivedere o annullare una modifica alla volta senza
   toccare le altre.
5. Claude ricompila, verifica che non ci siano riferimenti o citazioni rotti,
   pusha, e ti riassume cosa è cambiato e cosa è rimasto aperto.

`marks.cmd` elenca i marcatori aperti: lancialo quando vuoi vedere cosa resta.

## Regole che restano valide sempre

- I **numeri e i risultati non si toccano** senza un dato che li sostenga. Se un
  valore sembra sbagliato, Claude lo verifica sui dati e lo segnala; corregge solo
  quando la verifica lo dimostra, e lo scrive nel commit.
- Il **paper SPH è pubblicato**: quel capitolo va tenuto riformulato, non
  ricopiato.
- Lo **stile di riferimento** è il paper M&C sulla criticality search col burnup.
- Se una richiesta contraddice i dati, Claude lo dice invece di eseguirla.

## Se una revisione è grossa

Per riscritture ampie (un capitolo intero, un cambio di struttura) conviene
lavorarla in un ramo:

    git switch -c revisione-capitolo3

Si compila e si legge lì, e si porta su `main` quando va bene. Overleaf si può
puntare al ramo dal pannello GitHub.
