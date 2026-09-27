# Senior Network Engineer Skill Bundle

[繁體中文](../README.md) | [English](README.en.md) | [简体中文](README.zh-CN.md) | [粵語](README.yue.md) | [日本語](README.ja.md) | [한국어](README.ko.md) | [Español](README.es.md) | [Português (Brasil)](README.pt-BR.md) | **Français** | [Deutsch](README.de.md) | [Русский](README.ru.md) | [Tiếng Việt](README.vi.md) | [Bahasa Indonesia](README.id.md) | [ไทย](README.th.md) | [Türkçe](README.tr.md) | [العربية](README.ar.md)

Un ensemble de skills personnels destiné aux ingénieurs réseau seniors : un skill principal multi-constructeurs et quatre subskills par constructeur, regroupés dans un seul dépôt Git afin que plusieurs ordinateurs et outils d'IA partagent une source de vérité unique.

Les skills suivent le [format ouvert Agent Skills](https://agentskills.io/specification) (chaque dossier contient `SKILL.md` et un répertoire `references/` facultatif) et peuvent être installés dans Claude, ChatGPT/Codex, Google Antigravity, Gemini CLI, Cursor, GitHub Copilot et les autres outils qui prennent en charge ce format.

Le contenu sensible au temps (versions, EoL, CVE, PQC, capacités et chemins d'installation des outils d'IA) a été vérifié à la date du **2026-09-27**.

> **Note sur la langue :** Le contenu des skills est rédigé en chinois traditionnel et demande par défaut à l'IA de répondre en chinois traditionnel avec la terminologie IT des entreprises taïwanaises. Si vous souhaitez obtenir les réponses dans une autre langue, indiquez-le explicitement dans votre requête.

## Sommaire

- [Skills inclus](#skills-inclus)
- [Structure des répertoires](#structure-des-répertoires)
- [Avant l'installation](#avant-linstallation)
- [Commandes d'installation communes](#commandes-dinstallation-communes)
- [Installation par plateforme](#installation-par-plateforme)
- [Utilisation](#utilisation)
- [Mise à jour](#mise-à-jour)
- [Informations sensibles au temps](#informations-sensibles-au-temps)
- [Règles de maintenance](#règles-de-maintenance)

## Skills inclus

| Skill | Périmètre |
|---|---|
| `senior-network-engineer` | Skill principal. Architecture et dépannage multi-constructeurs, analyse de paquets/sessions, HA/DR, gouvernance des CVE et des versions, PQC, fondamentaux de sécurité CEH/CISSP, gouvernance des AI Agent/MCP, communication avec les clients et les constructeurs, HLD/LLD/MOP/RCA et formation ; oriente les questions vers les subskills ci-dessous |
| `palo-alto-architect` | PAN-OS NGFW, Panorama, Strata Cloud Manager, Prisma SASE, Cortex (XDR/XSIAM/XSOAR/AgentiX/Cortex Cloud), CVE et PQC |
| `fortinet-security-fabric-architect` | FortiGate/FortiOS, FortiManager, FortiAnalyzer, SD-WAN, ZTNA, migration de SSL VPN vers IPsec, PSIRT et PQC/QKD |
| `cisco-network-dc-architect` | Catalyst, Nexus/Nexus Dashboard, ACI, VXLAN EVPN, Catalyst SD-WAN, WLC 9800/CW9800, ISE, Secure Firewall, PSIRT et PQC/MACsec |
| `hpe-aruba-network-architect` | AOS-8/AOS-10, Instant AOS-8, HPE Aruba Networking Central, ClearPass, AOS-CX/AOS-Switch, HPE Security Bulletins et PPK/PQC |

## Structure des répertoires

```text
.
├── README.md                             # Chinois traditionnel (version de référence)
├── README/                               # Traductions (15 langues)
│   └── README.<lang>.md
├── bundle-manifest.json                  # Nom du bundle, version et liste des skills
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

## Avant l'installation

1. **Installez les cinq skills dans le même dossier.** Le skill principal charge les subskills via le chemin relatif `../<subskill>/SKILL.md`, qui ne se résout que si les cinq dossiers se trouvent côte à côte.
2. **Ne renommez pas les dossiers.** La plupart des outils exigent que le nom du dossier corresponde au `name` défini dans `SKILL.md` et peuvent ignorer silencieusement un skill en cas de divergence.
3. **Sur les plateformes à téléversement (Claude web/bureau, ChatGPT web), téléversez et activez les cinq skills.** Sur ces plateformes, chaque skill est indépendant. Le Centre d'aide Anthropic indique que les skills ne peuvent pas référencer explicitement d'autres skills, mais Claude combine automatiquement plusieurs skills lorsque c'est pertinent.
4. **Installez une fois, partagez entre les outils.** `~/.agents/skills` est un emplacement commun lu par Codex/ChatGPT bureau, Cursor, GitHub Copilot et Gemini CLI ; Claude Code et Antigravity nécessitent leurs propres répertoires.

## Commandes d'installation communes

Clonez d'abord ce dépôt, puis exécutez les commandes depuis la racine du dépôt. Remplacez `$dest` / `DEST` par le chemin correspondant à votre plateforme, indiqué dans le tableau de la section suivante.

**Windows (PowerShell)**

```powershell
git clone https://github.com/Scorpio-meow/senior-network-engineer-skill-bundle.git
Set-Location senior-network-engineer-skill-bundle

$dest = Join-Path $HOME '.agents/skills'      # À remplacer selon la plateforme
New-Item -ItemType Directory -Path $dest -Force | Out-Null

# Option 1 : copie (meilleure compatibilité ; recopier après chaque mise à jour)
Copy-Item ./skills/* $dest -Recurse -Force

# Option 2 : jonctions (les modifications du dépôt s'appliquent immédiatement ; uniquement pour les outils qui prennent officiellement en charge les liens)
Get-ChildItem ./skills -Directory | ForEach-Object {
    New-Item -ItemType Junction -Path (Join-Path $dest $_.Name) -Target $_.FullName
}
```

**macOS / Linux**

```bash
git clone https://github.com/Scorpio-meow/senior-network-engineer-skill-bundle.git
cd senior-network-engineer-skill-bundle

DEST=~/.agents/skills        # À remplacer selon la plateforme
mkdir -p "$DEST"

# Option 1 : copie
cp -R skills/* "$DEST/"

# Option 2 : liens symboliques (uniquement pour les outils qui prennent officiellement en charge les liens)
for d in "$PWD"/skills/*/; do ln -s "${d%/}" "$DEST/"; done
```

La création des liens échoue si un dossier portant le même nom existe déjà à la destination ; sauvegardez ou supprimez vous-même l'ancienne version au préalable.

## Installation par plateforme

### Référence rapide

| Plateforme | Chemin personnel (global) | Chemin projet | Liens pris en charge | Invocation manuelle |
|---|---|---|---|---|
| Claude Code | `~/.claude/skills` | `.claude/skills` | Oui | `/senior-network-engineer` |
| Claude web/bureau | Téléverser un ZIP (voir ci-dessous) | — | — | Saisir `/` et choisir |
| ChatGPT bureau, Codex CLI/IDE | `~/.agents/skills` | `.agents/skills` | Oui | ChatGPT : `@` ; Codex : `$senior-network-engineer` ou `/skills` |
| ChatGPT web | Téléverser (voir ci-dessous) | — | — | Automatique ou `@` |
| Antigravity 2.0 / IDE | `~/.gemini/config/skills` | `.agents/skills` | Non documenté | `/senior-network-engineer` |
| Antigravity CLI | `~/.gemini/antigravity-cli/skills` | `.agents/skills` | Non documenté | `/senior-network-engineer` |
| Gemini CLI | `~/.gemini/skills` ou `~/.agents/skills` | `.gemini/skills` ou `.agents/skills` | Oui | Automatique (`/skills list` pour afficher) |
| Cursor | `~/.cursor/skills` ou `~/.agents/skills` | `.cursor/skills` ou `.agents/skills` | Non documenté | Saisir `/` dans le chat Agent |
| GitHub Copilot (VS Code, CLI) | `~/.copilot/skills` ou `~/.agents/skills` | `.github/skills` ou `.agents/skills` | Non documenté | `/senior-network-engineer` |
| Hermes Agent | `~/.hermes/skills/<catégorie>` | `.hermes/skills` ou `.agents/skills` | Non documenté | `/senior-network-engineer` |

Chaque outil charge également un skill automatiquement lorsque sa description correspond à la tâche. Pour les outils marqués « Non documenté », la documentation officielle ne précise pas si les liens sont pris en charge ; installez par copie.

### Claude Code

```bash
DEST=~/.claude/skills        # Pour le périmètre projet, utiliser .claude/skills
```

- Copiez ou créez des liens à l'aide des commandes communes (les liens sont explicitement pris en charge dans la documentation officielle).
- Les modifications s'appliquent automatiquement à la session en cours ; si `~/.claude/skills` n'existait pas au démarrage, exécutez `/reload-skills`.
- Saisissez `/skills` pour afficher les skills chargés.
- `~/.claude/skills` s'applique uniquement à Claude Code en local, et non à Cowork ni aux sessions cloud.

### Claude (claude.ai web, bureau)

Disponible avec les offres payantes (Pro, Max, Team, Enterprise).

1. Activez l'exécution de code : **Settings > Capabilities > Code execution and file creation**. Avec Team/Enterprise, un Owner doit activer Skills et l'exécution de code dans **Organization settings > Plugins & skills**.
2. Empaquetez chacun des cinq skills dans son propre ZIP. Le niveau supérieur du ZIP doit être le dossier du skill lui-même (par exemple `palo-alto-architect/SKILL.md`) ; ne placez pas `SKILL.md` directement à la racine du ZIP.

   ```bash
   mkdir -p dist && cd skills
   for s in */; do zip -r "../dist/${s%/}.zip" "${s%/}"; done
   cd .. && unzip -l dist/senior-network-engineer.zip   # Chaque entrée doit commencer par senior-network-engineer/
   ```

   ```powershell
   # Sous Windows, utilisez PowerShell 7 (pwsh) ; Compress-Archive de Windows PowerShell 5.1 peut produire des formats de chemin incompatibles
   New-Item -ItemType Directory -Path dist -Force | Out-Null
   Get-ChildItem ./skills -Directory | ForEach-Object {
       Compress-Archive -Path $_.FullName -DestinationPath "dist/$($_.Name).zip" -Force
   }
   ```

3. Accédez à **Customize > Skills**, choisissez **+** → **Create skill** → **Upload a skill**, téléversez les cinq ZIP un par un, puis activez-les tous.
4. Décrivez votre tâche dans une conversation pour qu'ils soient utilisés automatiquement, ou saisissez `/` dans la zone de saisie pour choisir un skill.

**Limite de longueur de la description :** Le Centre d'aide Claude indique une limite de 200 caractères pour les descriptions (la documentation développeur de claude.com et la spécification Agent Skills autorisent 1 024 caractères). Ce bundle respecte la limite plus stricte de 200 caractères ; les cinq descriptions font chacune entre 161 et 177 caractères.

**Alternative : téléverser les cinq skills en une seule fois sous forme de plugin** (offre Pro ou supérieure). Les plugins Claude nécessitent un manifeste `.claude-plugin/plugin.json`, que ce dépôt n'inclut pas ; générez-le lors de l'empaquetage :

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

Téléversez ensuite `dist/senior-network-engineer-bundle.zip` dans **Customize > Plugins**.

### ChatGPT

**ChatGPT bureau :** Partage les skills locaux avec Codex ; une installation dans `~/.agents/skills` suffit (voir la section suivante). Saisissez `@` dans ChatGPT pour choisir un skill.

**ChatGPT web :** Réservé aux offres Business, Enterprise, Healthcare et Edu, et soumis aux paramètres de l'administrateur de l'espace de travail.

1. Choisissez **Plugins** dans la barre latérale.
2. Dans **Plugin Directory**, ouvrez l'onglet **Skills**.
3. Choisissez **Create** → **Upload from your computer** et téléversez les cinq skills un par un. ChatGPT analyse d'abord chaque téléversement ; le résultat peut afficher "Needs Review" ou "Blocked".

La documentation officielle d'OpenAI ne précise pas le format de fichier à téléverser. Essayez d'abord les ZIP par skill de la section précédente ; s'ils ne sont pas acceptés, adaptez-vous selon les instructions de l'écran de téléversement.

### OpenAI Codex (CLI, extension IDE)

```bash
DEST=~/.agents/skills        # Pour le périmètre projet, utiliser .agents/skills dans le dépôt
```

- Copiez ou créez des liens à l'aide des commandes communes (les liens sont explicitement pris en charge dans la documentation officielle).
- Codex détecte automatiquement les modifications des skills ; redémarrez Codex s'ils n'apparaissent pas.
- Invoquez avec `$senior-network-engineer`, ou exécutez `/skills` pour en choisir un.
- L'ancien chemin `$CODEX_HOME/skills` (`~/.codex/skills` lorsque `CODEX_HOME` n'est pas défini) a été retiré de la documentation officielle, mais Codex le charge toujours en tant que chemin obsolète. S'il y reste une autre copie de ce bundle, les skills portant le même nom apparaissent en double ; supprimez l'ancienne installation.

### Google Antigravity (2.0, IDE, CLI)

```bash
DEST=~/.gemini/config/skills                # Antigravity 2.0 et IDE (global)
DEST=~/.gemini/antigravity-cli/skills       # Antigravity CLI (global)
DEST=<racine-du-projet>/.agents/skills      # Périmètre projet partagé par les trois
```

- Les trois interfaces utilisent des chemins globaux différents. Si vous utilisez à la fois 2.0/IDE et la CLI, installez dans les deux chemins globaux, ou utilisez plutôt le chemin `.agents/skills` au niveau du projet.
- L'IDE prend encore en charge l'ancien chemin `~/.gemini/antigravity/skills`.
- Migration depuis Gemini CLI : `~/.gemini/skills` correspond à `~/.gemini/antigravity-cli/skills` ; le répertoire `.gemini/skills` d'un projet doit être renommé ou déplacé manuellement vers `.agents/skills`.
- La CLI peut aussi installer via un plugin : créez un dossier contenant `plugin.json` et `skills/`, puis exécutez `agy plugin install <dossier-du-plugin>` ; saisissez `/skills` dans la TUI pour afficher les skills chargés.

### Gemini CLI

Gemini CLI n'est plus proposé aux utilisateurs individuels depuis le 2026-06-18 (remplacé par Antigravity CLI). Seules les licences Gemini Code Assist Standard/Enterprise et les clés Gemini API payantes permettent de continuer à l'utiliser.

```bash
DEST=~/.gemini/skills        # Ou ~/.agents/skills ; pour le périmètre projet, utiliser .gemini/skills ou .agents/skills
```

- Vous pouvez également créer des liens avec la commande officielle : `gemini skills link ./skills`.
- Exécutez `/skills reload` dans une session pour charger les nouveaux skills, et `/skills list` pour les afficher.
- L'accès aux fichiers du dossier d'un skill n'est accordé que lorsque le skill est activé ; une demande d'autorisation peut apparaître lorsque le skill principal lit un subskill.

### Cursor

```bash
DEST=~/.cursor/skills        # Ou ~/.agents/skills ; pour le périmètre projet, utiliser .cursor/skills ou .agents/skills
```

- Cursor découvre automatiquement les skills au démarrage ; affichez-les dans **Customize → Skills**.
- Invoquez en saisissant `/` dans le chat Agent et en choisissant un skill.
- Seul `~/.cursor/skills` est synchronisé avec les Cloud Agents (activez **Sync Skills for Cloud Agents** dans **Settings → Agents**) ; `~/.agents/skills` n'est synchronisé ni avec les Cloud Agents ni avec le SSH distant.

### GitHub Copilot (mode agent VS Code, Copilot CLI)

```bash
DEST=~/.copilot/skills       # Ou ~/.agents/skills ; pour le périmètre projet, utiliser .github/skills ou .agents/skills
```

- Si votre licence Copilot est fournie par une organisation ou une entreprise, un administrateur doit autoriser les fonctionnalités concernées dans la stratégie.
- VS Code : saisissez `/skills` dans Chat pour ouvrir les paramètres des skills. Copilot CLI : `/skills list`, `/skills reload`.
- Copilot cloud agent et code review s'exécutent sur GitHub et ne lisent que les skills présents dans le dépôt (périmètre projet).

### Hermes Agent

```bash
DEST=~/.hermes/skills/network   # Placer les cinq skills dans le même dossier de catégorie
```

- Les nouveaux skills s'appliquent dans une nouvelle session (ou exécutez `/reset`).
- Les répertoires `.hermes/skills` et `.agents/skills` d'un projet ne sont chargés qu'après l'exécution de `hermes skills trust` dans ce dépôt.
- Si les skills sont déjà installés dans `~/.agents/skills`, ajoutez ce chemin à `skills.external_dirs` dans `~/.hermes/config.yaml` pour les partager.
- L'installation un par un depuis GitHub avec `hermes skills install` est déconseillée : elle ne copie que les fichiers directement référencés par `SKILL.md`, de sorte que les références `../` entre skills ne sont pas téléchargées.

## Utilisation

Décrivez votre tâche et l'outil choisit automatiquement les skills en fonction de leurs descriptions. Pour en choisir un explicitement, invoquez-le selon la méthode prise en charge par votre plateforme (voir le tableau de référence rapide). Par exemple, dans Codex :

```text
$senior-network-engineer Analyse cet incident réseau multi-constructeurs. Liste d'abord les éléments de preuve et les hypothèses, puis fournis un MOP avec un plan de rollback. Merci de répondre en français.
```

Pour les questions portant sur un seul constructeur, vous pouvez invoquer directement un subskill, comme `palo-alto-architect`, `fortinet-security-fabric-architect`, `cisco-network-dc-architect` ou `hpe-aruba-network-architect`.

## Mise à jour

Sur l'ordinateur où vous avez effectué les modifications :

```bash
git status --short
git add -- <fichiers-réellement-modifiés>
git commit -m "<description à objectif unique>"
git push
```

Sur les autres ordinateurs :

```bash
git pull --ff-only
```

- Outils installés via des liens : les modifications s'appliquent dès le pull effectué.
- Outils installés par copie : relancez la commande de copie après le pull.
- Plateformes à téléversement (Claude, ChatGPT web) : réempaquetez et téléversez à nouveau les skills modifiés.

## Informations sensibles au temps

- Les versions, EoL/EoS, CVE, Recommended Releases, la prise en charge de la PQC et les capacités des outils d'IA s'appuient sur la documentation des constructeurs ou la documentation officielle, avec la date de vérification indiquée dans le texte.
- Les chemins des skills et les procédures de téléversement des outils d'IA évoluent fréquemment. Ce document reflète la documentation officielle à la date du 2026-09-27 ; si un skill ne se charge pas après l'installation, consultez d'abord la documentation la plus récente de l'outil.
- Au moment de la vérification, les éléments suivants n'ont pu être trouvés que dans des sources tierces ou communautaires, car les pages officielles exigent une connexion au portail de support du constructeur. Le contenu des skills les signale par la mention « à revérifier avant de citer » :
  - Dates EoS de FortiNAC 9.4 et End of Order de FortiGate CNF (Fortinet Product Life Cycle, nécessite un compte FortiCare)
  - EoS du logiciel AirWave et statut de fin de commercialisation des 2930F/2930M/5400R (HPE Networking Support Portal)
- Lors de la mise à jour d'un contenu sensible au temps, mettez également à jour la date de vérification dans la section concernée ainsi que la `version` dans `bundle-manifest.json`.

## Règles de maintenance

- Modifiez les skills de référence uniquement dans `skills/` ; ne modifiez pas les copies situées aux emplacements d'installation.
- Maintenez les cinq skills au même niveau ; gardez `SKILL.md` concis et sous les 500 lignes, avec les détails dans `references/` sur un seul niveau de profondeur.
- Le `name` du frontmatter doit correspondre au nom du dossier ; la `description` ne doit pas dépasser 200 caractères (pour respecter la limite de téléversement du Centre d'aide Claude) et doit indiquer à la fois ce que fait le skill et quand le déclencher.
- N'affirmez pas de mémoire des informations sur les CVE, fixed releases, EoL, PQC, CLI, licences ou fonctionnalités des plateformes d'IA ; appuyez-vous sur la documentation des constructeurs ou la documentation officielle et consignez la date de vérification.
- Ne commitez pas de configurations client, PCAP, comptes, mots de passe, PSK, clés privées, API tokens, licences ni pièces jointes de tickets.
- Les recommandations à haut risque doivent inclure les éléments de preuve, le blast radius, les conditions d'arrêt, le rollback et la validation.
- `README.md` (chinois traditionnel) est le README de référence. Lors de sa modification, mettez à jour toutes les traductions `README/README.<lang>.md` dans le même commit.
