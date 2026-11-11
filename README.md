# Klangbild Installer

Installiert **alle Klangbild-Plugins auf einmal** – Audio Unit für Logic Pro und VST3,
für Apple Silicon und Intel.

## Installation (empfohlen): ein Befehl im Terminal

Programme → Dienstprogramme → **Terminal** öffnen, diese Zeile einfügen und Enter drücken:

```
curl -fsSL https://raw.githubusercontent.com/Guitoli1/KlangbildInstaller/main/install.sh | bash
```

Das lädt die aktuelle Version aller Plugins, ersetzt alte Versionen und macht sie macOS sofort bekannt –
kein `xattr`, keine Einzel-Downloads. Danach Logic Pro (neu) starten.

**Aktualisieren:** einfach denselben Befehl noch einmal ausführen.

## Alternative: Installer-Paket zum Doppelklicken

Unter **Releases** (rechts) `Klangbild-Installer.pkg` laden und öffnen.
Weil das Paket nicht bei Apple registriert ist, blockiert macOS es beim ersten Mal:
**Systemeinstellungen → Datenschutz & Sicherheit → ganz unten „Dennoch öffnen“**, dann durch den Installer klicken.

## Enthaltene Plugins

| Gitarre, Bass & Kanal | Mischen | Mastering |
|---|---|---|
| Klangbild Kalibrator | Klangbild EQ | Klangbild Band |
| Klangbild Drive | Klangbild Opto | Klangbild Pult |
| Klangbild Duo | Klangbild Bus | Klangbild Trio |
| Klangbild Box | Klangbild Platte | Klangbild Weite |
| Klangbild Raum | Klangbild Drums | Klangbild Limit |
| Klangbild Kanalzug | | Klangbild Lautheit |
| Klangbild Bass | | Klangbild Referenz |
| Klangbild Vibe | Klangbild Stimme | |
| Klangbild Feder | | |
| Klangbild Echo | | |
| Klangbild Leslie | | |

Alle Oberflächen lassen sich an der unteren rechten Ecke von 75 % bis 150 % skalieren.

Installiert wird in deinen Benutzer-Ordner:
`~/Library/Audio/Plug-Ins/Components` (AU) und `~/Library/Audio/Plug-Ins/VST3`.

## Neue Version bauen

Tab **Actions** → **Alle Plugins bauen und veröffentlichen** → **Run workflow**.
Alle Plugins werden frisch aus ihren Repos gebaut (ca. 25 Minuten) und als neues Release veröffentlicht.

## Deinstallieren

Im Finder ⇧⌘G → `~/Library/Audio/Plug-Ins/Components` bzw. `…/VST3` öffnen und die
„Klangbild …“-Dateien in den Papierkorb legen.
