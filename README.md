# BashScripts

Sada malých Bash skriptů z přípravy na DevOps / Linux administraci. Každý skript řeší typický provozní úkol (kontrola dostupnosti, úklid disku, analýza logů).

## Skripty

| Skript | Co dělá | Použití |
|---|---|---|
| `check_servers.sh` | Projde seznam IP/hostů ze souboru, pingne je a vypíše počet dostupných/nedostupných + čas kontroly | `./check_servers.sh mock_server_file` |
| `cleanup.sh` | Najde soubory starší než 7 dní a core dumpy v zadaném adresáři, zeptá se na potvrzení, smaže je a ukáže velikost před/po | `./cleanup.sh test-logs` |
| `log_report.sh` | Z `access.log` spočítá počet požadavků se statusem 200 a 500 a nejčastější endpoint (`awk`, `sort`, `uniq`) | `./log_report.sh` |
| `mock_server_file.sh` | Vygeneruje testovací seznam `192.168.0.1–255` | `./mock_server_file.sh` |

Ukázková data: `access.log` (vzorový log), `mock_server_file` (vygenerovaný seznam IP), `test-logs/` (prázdné soubory pro test `cleanup.sh`).

## Požadavky

Bash, běžné coreutils (`find`, `du`, `awk`, `ping`). Testováno na macOS a Linuxu. Pozor: `ping -t 2` v `check_servers.sh` je timeout syntaxe macOS; na Linuxu se timeout zadává přes `-W 2`.

## Co jsem se naučil

- čtení souboru po řádcích (`while read ... done < file`), argumenty `$1`, aritmetika `$(( ))`
- `find` s `-mtime`, `-name`, `-delete`; interaktivní potvrzení před destruktivní akcí
- zpracování logů přes `awk` / `sort | uniq -c`, here-doc pro výstup
- ošetření návratových kódů (`if ping ...`) a přesměrování `> /dev/null 2>&1`

## Licence

MIT, viz [LICENSE](LICENSE).
