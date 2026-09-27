# Senior Network Engineer Skill Bundle

[繁體中文](../README.md) | [English](README.en.md) | [简体中文](README.zh-CN.md) | [粵語](README.yue.md) | [日本語](README.ja.md) | [한국어](README.ko.md) | [Español](README.es.md) | [Português (Brasil)](README.pt-BR.md) | [Français](README.fr.md) | **Deutsch** | [Русский](README.ru.md) | [Tiếng Việt](README.vi.md) | [Bahasa Indonesia](README.id.md) | [ไทย](README.th.md) | [Türkçe](README.tr.md) | [العربية](README.ar.md)

Ein persönliches Skill-Bundle für Senior Network Engineers: ein herstellerübergreifender Haupt-Skill plus vier herstellerspezifische Subskills, verwaltet in einem einzigen Git-Repository, damit mehrere Computer und AI-Tools eine gemeinsame Single Source of Truth nutzen.

Die Skills folgen dem [offenen Agent-Skills-Format](https://agentskills.io/specification) (jeder Ordner enthält `SKILL.md` und optional `references/`) und lassen sich in Claude, ChatGPT/Codex, Google Antigravity, Gemini CLI, Cursor, GitHub Copilot und weiteren Tools installieren, die dieses Format unterstützen.

Zeitkritische Inhalte (Versionen, EoL, CVEs, PQC, Funktionen und Installationspfade von AI-Tools) wurden mit Stand **2026-09-27** verifiziert.

> **Hinweis zur Sprache:** Die Skill-Inhalte sind in traditionellem Chinesisch verfasst und weisen die AI an, standardmäßig in traditionellem Chinesisch mit der in Taiwan üblichen Enterprise-IT-Terminologie zu antworten. Wenn Sie Antworten in einer anderen Sprache benötigen, geben Sie diese in Ihrer Anfrage ausdrücklich an.

## Inhalt

- [Enthaltene Skills](#enthaltene-skills)
- [Verzeichnisstruktur](#verzeichnisstruktur)
- [Vor der Installation](#vor-der-installation)
- [Allgemeine Installationsbefehle](#allgemeine-installationsbefehle)
- [Installation nach Plattform](#installation-nach-plattform)
- [Verwendung](#verwendung)
- [Aktualisierung](#aktualisierung)
- [Zeitkritische Informationen](#zeitkritische-informationen)
- [Wartungsregeln](#wartungsregeln)

## Enthaltene Skills

| Skill | Umfang |
|---|---|
| `senior-network-engineer` | Haupt-Skill. Herstellerübergreifende Architektur und Fehlerbehebung, Paket-/Session-Analyse, HA/DR, CVE- und Versions-Governance, PQC, Sicherheitsgrundlagen nach CEH/CISSP, AI-Agent-/MCP-Governance, Kommunikation mit Kunden und Herstellern, HLD/LLD/MOP/RCA und Schulungen; leitet Fragen an die folgenden Subskills weiter |
| `palo-alto-architect` | PAN-OS NGFW, Panorama, Strata Cloud Manager, Prisma SASE, Cortex (XDR/XSIAM/XSOAR/AgentiX/Cortex Cloud), CVEs und PQC |
| `fortinet-security-fabric-architect` | FortiGate/FortiOS, FortiManager, FortiAnalyzer, SD-WAN, ZTNA, Migration von SSL VPN zu IPsec, PSIRT und PQC/QKD |
| `cisco-network-dc-architect` | Catalyst, Nexus/Nexus Dashboard, ACI, VXLAN EVPN, Catalyst SD-WAN, 9800/CW9800 WLC, ISE, Secure Firewall, PSIRT und PQC/MACsec |
| `hpe-aruba-network-architect` | AOS-8/AOS-10, Instant AOS-8, HPE Aruba Networking Central, ClearPass, AOS-CX/AOS-Switch, HPE Security Bulletins und PPK/PQC |

## Verzeichnisstruktur

```text
.
├── README.md                             # Traditionelles Chinesisch (maßgeblich)
├── README/                               # Übersetzungen (15 Sprachen)
│   └── README.<lang>.md
├── bundle-manifest.json                  # Bundle-Name, Version und Skill-Liste
└── skills/
    ├── senior-network-engineer/
    │   ├── SKILL.md
    │   └── references/
    │       ├── advanced-troubleshooting.md
    │       ├── ai-assisted-network-engineering.md
    │       ├── deliverables-and-training.md
    │       ├── principal-architect-personalization.md
    │       ├── security-foundations.md
    │       └── stakeholder-communication.md
    ├── palo-alto-architect/
    │   └── SKILL.md
    ├── fortinet-security-fabric-architect/
    │   ├── SKILL.md
    │   └── references/
    │       ├── field-playbooks.md
    │       └── product-scope.md
    ├── cisco-network-dc-architect/
    │   └── SKILL.md
    └── hpe-aruba-network-architect/
        └── SKILL.md
```

## Vor der Installation

1. **Installieren Sie alle fünf Skills in denselben Ordner.** Der Haupt-Skill lädt die Subskills über den relativen Pfad `../<subskill>/SKILL.md`, der nur aufgelöst wird, wenn die fünf Ordner nebeneinander liegen.
2. **Benennen Sie die Ordner nicht um.** Die meisten Tools verlangen, dass der Ordnername mit dem `name` in `SKILL.md` übereinstimmt, und überspringen einen Skill bei Abweichung möglicherweise stillschweigend.
3. **Laden Sie auf Upload-basierten Plattformen (Claude Web/Desktop, ChatGPT Web) alle fünf hoch und aktivieren Sie sie.** Auf diesen Plattformen ist jeder Skill eigenständig. Laut Anthropic Help Center können Skills nicht explizit auf andere Skills verweisen, Claude kombiniert jedoch bei Bedarf automatisch mehrere Skills.
4. **Einmal installieren, toolübergreifend nutzen.** `~/.agents/skills` ist ein toolübergreifender Speicherort, der von Codex/ChatGPT Desktop, Cursor, GitHub Copilot und Gemini CLI gelesen wird; Claude Code und Antigravity benötigen eigene Verzeichnisse.

## Allgemeine Installationsbefehle

Klonen Sie zunächst dieses Repository und führen Sie die Befehle anschließend im Stammverzeichnis des Repositorys aus. Ersetzen Sie `$dest` / `DEST` durch den Pfad Ihrer Plattform aus der Tabelle im nächsten Abschnitt.

**Windows (PowerShell)**

```powershell
git clone https://github.com/Scorpio-meow/senior-network-engineer-skill-bundle.git
Set-Location senior-network-engineer-skill-bundle

$dest = Join-Path $HOME '.agents/skills'      # Je nach Plattform ersetzen
New-Item -ItemType Directory -Path $dest -Force | Out-Null

# Option 1: Kopieren (beste Kompatibilität; nach jedem Update erneut kopieren)
Copy-Item ./skills/* $dest -Recurse -Force

# Option 2: Junctions (Änderungen im Repository wirken sofort; nur für Tools mit offizieller Link-Unterstützung)
Get-ChildItem ./skills -Directory | ForEach-Object {
    New-Item -ItemType Junction -Path (Join-Path $dest $_.Name) -Target $_.FullName
}
```

**macOS / Linux**

```bash
git clone https://github.com/Scorpio-meow/senior-network-engineer-skill-bundle.git
cd senior-network-engineer-skill-bundle

DEST=~/.agents/skills        # Je nach Plattform ersetzen
mkdir -p "$DEST"

# Option 1: Kopieren
cp -R skills/* "$DEST/"

# Option 2: Symlinks (nur für Tools mit offizieller Link-Unterstützung)
for d in "$PWD"/skills/*/; do ln -s "${d%/}" "$DEST/"; done
```

Das Anlegen von Links schlägt fehl, wenn am Ziel bereits ein gleichnamiger Ordner existiert; sichern oder entfernen Sie die alte Version vorher selbst.

## Installation nach Plattform

### Kurzübersicht

| Plattform | Persönlicher (globaler) Pfad | Projektpfad | Links unterstützt | Manueller Aufruf |
|---|---|---|---|---|
| Claude Code | `~/.claude/skills` | `.claude/skills` | Ja | `/senior-network-engineer` |
| Claude Web/Desktop | ZIP hochladen (siehe unten) | — | — | `/` eingeben und auswählen |
| ChatGPT Desktop, Codex CLI/IDE | `~/.agents/skills` | `.agents/skills` | Ja | ChatGPT: `@`; Codex: `$senior-network-engineer` oder `/skills` |
| ChatGPT Web | Hochladen (siehe unten) | — | — | Automatisch oder `@` |
| Antigravity 2.0 / IDE | `~/.gemini/config/skills` | `.agents/skills` | Nicht dokumentiert | `/senior-network-engineer` |
| Antigravity CLI | `~/.gemini/antigravity-cli/skills` | `.agents/skills` | Nicht dokumentiert | `/senior-network-engineer` |
| Gemini CLI | `~/.gemini/skills` oder `~/.agents/skills` | `.gemini/skills` oder `.agents/skills` | Ja | Automatisch (Anzeige mit `/skills list`) |
| Cursor | `~/.cursor/skills` oder `~/.agents/skills` | `.cursor/skills` oder `.agents/skills` | Nicht dokumentiert | `/` im Agent-Chat eingeben |
| GitHub Copilot (VS Code, CLI) | `~/.copilot/skills` oder `~/.agents/skills` | `.github/skills` oder `.agents/skills` | Nicht dokumentiert | `/senior-network-engineer` |
| Hermes Agent | `~/.hermes/skills/<kategorie>` | `.hermes/skills` oder `.agents/skills` | Nicht dokumentiert | `/senior-network-engineer` |

Jedes Tool lädt einen Skill außerdem automatisch, wenn dessen Beschreibung zur Aufgabe passt. Bei Tools mit dem Vermerk „Nicht dokumentiert“ geht aus der offiziellen Dokumentation nicht hervor, ob Links unterstützt werden; installieren Sie dort per Kopie.

### Claude Code

```bash
DEST=~/.claude/skills        # Für den Projektbereich .claude/skills verwenden
```

- Kopieren oder verlinken Sie mit den allgemeinen Befehlen (Links werden in der offiziellen Dokumentation ausdrücklich unterstützt).
- Änderungen werden in der aktuellen Session automatisch wirksam; falls `~/.claude/skills` beim Start noch nicht existierte, führen Sie `/reload-skills` aus.
- Geben Sie `/skills` ein, um die geladenen Skills anzuzeigen.
- `~/.claude/skills` gilt nur für das lokale Claude Code, nicht für Cowork oder Cloud-Sessions.

### Claude (claude.ai Web, Desktop)

Verfügbar in kostenpflichtigen Plänen (Pro, Max, Team, Enterprise).

1. Aktivieren Sie die Codeausführung: **Settings > Capabilities > Code execution and file creation**. Bei Team/Enterprise muss ein Owner Skills und Codeausführung unter **Organization settings > Plugins & skills** aktivieren.
2. Packen Sie jeden der fünf Skills in ein eigenes ZIP. Die oberste Ebene im ZIP muss der Skill-Ordner selbst sein (zum Beispiel `palo-alto-architect/SKILL.md`); legen Sie `SKILL.md` nicht direkt in das Stammverzeichnis des ZIP.

   ```bash
   mkdir -p dist && cd skills
   for s in */; do zip -r "../dist/${s%/}.zip" "${s%/}"; done
   cd .. && unzip -l dist/senior-network-engineer.zip   # Jeder Eintrag sollte mit senior-network-engineer/ beginnen
   ```

   ```powershell
   # Unter Windows PowerShell 7 (pwsh) verwenden; Compress-Archive in Windows PowerShell 5.1 kann inkompatible Pfadformate erzeugen
   New-Item -ItemType Directory -Path dist -Force | Out-Null
   Get-ChildItem ./skills -Directory | ForEach-Object {
       Compress-Archive -Path $_.FullName -DestinationPath "dist/$($_.Name).zip" -Force
   }
   ```

3. Öffnen Sie **Customize > Skills**, wählen Sie **+** → **Create skill** → **Upload a skill**, laden Sie die fünf ZIPs nacheinander hoch und aktivieren Sie alle.
4. Beschreiben Sie Ihre Aufgabe in einer Unterhaltung, damit die Skills automatisch verwendet werden, oder geben Sie `/` im Eingabefeld ein, um einen Skill auszuwählen.

**Längenbegrenzung der Beschreibung:** Laut Claude Help Center gilt für Beschreibungen ein Limit von 200 Zeichen (die Entwicklerdokumentation auf claude.com und die Agent-Skills-Spezifikation erlauben 1.024 Zeichen). Dieses Bundle hält sich an das strengere Limit von 200 Zeichen; die fünf Beschreibungen umfassen jeweils 161–177 Zeichen.

**Alternative: alle fünf Skills auf einmal als Plugin hochladen** (ab Pro-Plan). Claude-Plugins benötigen ein `.claude-plugin/plugin.json`-Manifest, das in diesem Repository nicht enthalten ist; erzeugen Sie es beim Packen:

```bash
mkdir -p dist/snet-plugin/.claude-plugin
cp -R skills dist/snet-plugin/
cat > dist/snet-plugin/.claude-plugin/plugin.json <<'EOF'
{
  "name": "senior-network-engineer-bundle",
  "description": "Senior network engineer skills for Palo Alto, Fortinet, Cisco and HPE Aruba",
  "version": "2026.09.27"
}
EOF
(cd dist/snet-plugin && zip -r ../senior-network-engineer-bundle.zip .)
```

Laden Sie anschließend `dist/senior-network-engineer-bundle.zip` unter **Customize > Plugins** hoch.

### ChatGPT

**ChatGPT Desktop:** Nutzt die lokalen Skills gemeinsam mit Codex; eine Installation in `~/.agents/skills` genügt (siehe nächster Abschnitt). Geben Sie in ChatGPT `@` ein, um einen Skill auszuwählen.

**ChatGPT Web:** Nur in den Plänen Business, Enterprise, Healthcare und Edu verfügbar und abhängig von den Einstellungen des Workspace-Admins.

1. Wählen Sie in der Seitenleiste **Plugins**.
2. Öffnen Sie im **Plugin Directory** den Tab **Skills**.
3. Wählen Sie **Create** → **Upload from your computer** und laden Sie die fünf Skills nacheinander hoch. ChatGPT scannt jeden Upload zuerst; das Ergebnis kann „Needs Review“ oder „Blocked“ lauten.

Die offizielle Dokumentation von OpenAI legt das Dateiformat für den Upload nicht fest. Versuchen Sie zunächst die ZIPs pro Skill aus dem vorherigen Abschnitt; werden diese nicht akzeptiert, passen Sie sie gemäß den Hinweisen auf dem Upload-Bildschirm an.

### OpenAI Codex (CLI, IDE-Erweiterung)

```bash
DEST=~/.agents/skills        # Für den Projektbereich .agents/skills im Repository verwenden
```

- Kopieren oder verlinken Sie mit den allgemeinen Befehlen (Links werden in der offiziellen Dokumentation ausdrücklich unterstützt).
- Codex erkennt Änderungen an Skills automatisch; starten Sie Codex neu, falls sie nicht erscheinen.
- Rufen Sie den Skill mit `$senior-network-engineer` auf oder führen Sie `/skills` aus, um einen auszuwählen.
- Der alte Pfad `$CODEX_HOME/skills` (`~/.codex/skills`, wenn `CODEX_HOME` nicht gesetzt ist) wurde aus der offiziellen Dokumentation entfernt, wird von Codex aber weiterhin als veralteter Pfad geladen. Liegt dort noch eine weitere Kopie dieses Bundles, erscheinen gleichnamige Skills doppelt; entfernen Sie die alte Installation.

### Google Antigravity (2.0, IDE, CLI)

```bash
DEST=~/.gemini/config/skills                # Antigravity 2.0 und IDE (global)
DEST=~/.gemini/antigravity-cli/skills       # Antigravity CLI (global)
DEST=<projekt-root>/.agents/skills          # Von allen dreien gemeinsam genutzter Projektbereich
```

- Die drei Oberflächen verwenden unterschiedliche globale Pfade. Wenn Sie sowohl 2.0/IDE als auch die CLI nutzen, installieren Sie in beide globalen Pfade oder verwenden Sie stattdessen das projektbezogene `.agents/skills`.
- Die IDE unterstützt weiterhin den alten Pfad `~/.gemini/antigravity/skills`.
- Migration von Gemini CLI: `~/.gemini/skills` entspricht `~/.gemini/antigravity-cli/skills`; das `.gemini/skills` eines Projekts muss manuell umbenannt oder nach `.agents/skills` verschoben werden.
- Die CLI kann auch per Plugin installieren: Legen Sie einen Ordner mit `plugin.json` und `skills/` an und führen Sie dann `agy plugin install <plugin-ordner>` aus; geben Sie in der TUI `/skills` ein, um die geladenen Skills anzuzeigen.

### Gemini CLI

Gemini CLI steht Einzelnutzern seit dem 2026-06-18 nicht mehr zur Verfügung (abgelöst durch Antigravity CLI). Nur Lizenzen für Gemini Code Assist Standard/Enterprise und kostenpflichtige Gemini-API-Keys können es weiterhin nutzen.

```bash
DEST=~/.gemini/skills        # Oder ~/.agents/skills; für den Projektbereich .gemini/skills oder .agents/skills verwenden
```

- Links können Sie auch mit dem offiziellen Befehl anlegen: `gemini skills link ./skills`.
- Führen Sie in einer Session `/skills reload` aus, um neue Skills zu laden, und `/skills list`, um sie anzuzeigen.
- Dateizugriff auf den Ordner eines Skills wird erst gewährt, wenn der Skill aktiviert ist; beim Lesen eines Subskills durch den Haupt-Skill kann eine Berechtigungsabfrage erscheinen.

### Cursor

```bash
DEST=~/.cursor/skills        # Oder ~/.agents/skills; für den Projektbereich .cursor/skills oder .agents/skills verwenden
```

- Cursor erkennt Skills beim Start automatisch; Sie finden sie unter **Customize → Skills**.
- Rufen Sie einen Skill auf, indem Sie im Agent-Chat `/` eingeben und ihn auswählen.
- Nur `~/.cursor/skills` wird mit Cloud Agents synchronisiert (aktivieren Sie **Sync Skills for Cloud Agents** unter **Settings → Agents**); `~/.agents/skills` wird weder mit Cloud Agents noch mit Remote-SSH synchronisiert.

### GitHub Copilot (VS Code Agent-Modus, Copilot CLI)

```bash
DEST=~/.copilot/skills       # Oder ~/.agents/skills; für den Projektbereich .github/skills oder .agents/skills verwenden
```

- Stammt Ihre Copilot-Lizenz von einer Organisation oder einem Enterprise, muss ein Admin die entsprechenden Funktionen per Richtlinie freigeben.
- VS Code: Geben Sie im Chat `/skills` ein, um die Skill-Einstellungen zu öffnen. Copilot CLI: `/skills list`, `/skills reload`.
- Copilot cloud agent und Code Review laufen auf GitHub und lesen nur Skills innerhalb des Repositorys (Projektbereich).

### Hermes Agent

```bash
DEST=~/.hermes/skills/network   # Alle fünf Skills im selben Kategorieordner ablegen
```

- Neue Skills werden in einer neuen Session wirksam (oder führen Sie `/reset` aus).
- `.hermes/skills` und `.agents/skills` eines Projekts werden erst geladen, nachdem Sie in diesem Repository `hermes skills trust` ausgeführt haben.
- Sind die Skills bereits in `~/.agents/skills` installiert, fügen Sie diesen Pfad in `~/.hermes/config.yaml` zu `skills.external_dirs` hinzu, um sie gemeinsam zu nutzen.
- Die Einzelinstallation von GitHub mit `hermes skills install` wird nicht empfohlen: Dabei werden nur Dateien kopiert, auf die `SKILL.md` direkt verweist, sodass skillübergreifende `../`-Verweise nicht heruntergeladen werden.

## Verwendung

Beschreiben Sie Ihre Aufgabe, und das Tool wählt die Skills anhand ihrer Beschreibungen automatisch aus. Um einen Skill gezielt zu wählen, rufen Sie ihn so auf, wie es Ihre Plattform unterstützt (siehe Kurzübersicht). Zum Beispiel in Codex:

```text
$senior-network-engineer Analysieren Sie diesen herstellerübergreifenden Netzwerkvorfall. Listen Sie zuerst die Belege und Hypothesen auf und erstellen Sie dann einen MOP mit Rollback-Plan. Bitte antworten Sie auf Deutsch.
```

Bei Fragen zu einem einzelnen Hersteller können Sie einen Subskill direkt aufrufen, etwa `palo-alto-architect`, `fortinet-security-fabric-architect`, `cisco-network-dc-architect` oder `hpe-aruba-network-architect`.

## Aktualisierung

Auf dem Computer, auf dem Sie Änderungen vorgenommen haben:

```bash
git status --short
git add -- <tatsächlich-geänderte-dateien>
git commit -m "<Beschreibung mit einem einzigen Zweck>"
git push
```

Auf den anderen Computern:

```bash
git pull --ff-only
```

- Per Link installierte Tools: Änderungen werden direkt nach dem Pull wirksam.
- Per Kopie installierte Tools: Führen Sie den Kopierbefehl nach dem Pull erneut aus.
- Upload-basierte Plattformen (Claude, ChatGPT Web): Packen Sie die geänderten Skills neu und laden Sie sie erneut hoch.

## Zeitkritische Informationen

- Versionen, EoL/EoS, CVEs, Recommended Releases, PQC-Unterstützung und Funktionen von AI-Tools basieren auf Hersteller- bzw. offizieller Dokumentation; das Verifizierungsdatum ist jeweils im Text vermerkt.
- Skill-Pfade und Upload-Abläufe von AI-Tools ändern sich häufig. Dieses Dokument gibt den Stand der offiziellen Dokumentation vom 2026-09-27 wieder; wird ein Skill nach der Installation nicht geladen, prüfen Sie zuerst die aktuelle Dokumentation des Tools.
- Zum Zeitpunkt der Verifizierung waren die folgenden Punkte nur in Quellen Dritter oder der Community zu finden, da die offiziellen Seiten eine Anmeldung am Support-Portal des Herstellers erfordern. Die Skill-Inhalte kennzeichnen sie mit „vor dem Zitieren erneut verifizieren“:
  - EoS von FortiNAC 9.4 und End-of-Order-Termine von FortiGate CNF (Fortinet Product Life Cycle, erfordert ein FortiCare-Konto)
  - EoS der AirWave-Software sowie End-of-Sale-Status von 2930F/2930M/5400R (HPE Networking Support Portal)
- Aktualisieren Sie bei Änderungen an zeitkritischen Inhalten auch das Verifizierungsdatum im betreffenden Abschnitt und die `version` in `bundle-manifest.json`.

## Wartungsregeln

- Bearbeiten Sie die maßgeblichen Skills ausschließlich in `skills/`; bearbeiten Sie nicht die Kopien an den Installationsorten.
- Halten Sie die fünf Skills auf derselben Ebene; halten Sie `SKILL.md` knapp und unter 500 Zeilen, Details gehören in ein nur eine Ebene tiefes `references/`.
- Der `name` im Frontmatter muss mit dem Ordnernamen übereinstimmen; `description` darf höchstens 200 Zeichen lang sein (passend zum Upload-Limit des Claude Help Center) und muss sowohl angeben, was der Skill tut, als auch, wann er ausgelöst werden soll.
- Machen Sie keine Angaben zu CVEs, fixed releases, EoL, PQC, CLI, Lizenzierung oder Funktionen von AI-Plattformen aus dem Gedächtnis; stützen Sie sich auf Hersteller- bzw. offizielle Dokumentation und halten Sie das Verifizierungsdatum fest.
- Committen Sie keine Kundenkonfigurationen, PCAPs, Konten, Passwörter, PSKs, privaten Schlüssel, API-Tokens, Lizenzen oder Ticket-Anhänge.
- Empfehlungen mit hohem Risiko müssen Belege, blast radius, Abbruchkriterien, Rollback und Validierung enthalten.
- `README.md` (traditionelles Chinesisch) ist das maßgebliche README. Wenn Sie es ändern, aktualisieren Sie im selben Commit alle `README/README.<lang>.md`-Übersetzungen.
