# Senior Network Engineer Skill Bundle

[繁體中文](../README.md) | **English** | [简体中文](README.zh-CN.md) | [粵語](README.yue.md) | [日本語](README.ja.md) | [한국어](README.ko.md) | [Español](README.es.md) | [Português (Brasil)](README.pt-BR.md) | [Français](README.fr.md) | [Deutsch](README.de.md) | [Русский](README.ru.md) | [Tiếng Việt](README.vi.md) | [Bahasa Indonesia](README.id.md) | [ไทย](README.th.md) | [Türkçe](README.tr.md) | [العربية](README.ar.md)

A personal skill bundle for senior network engineers: one cross-vendor primary skill plus four vendor subskills, kept in a single Git repository so that multiple computers and AI tools share one source of truth.

The skills follow the [Agent Skills open format](https://agentskills.io/specification) (each folder contains `SKILL.md` and an optional `references/`) and can be installed into Claude, ChatGPT/Codex, Google Antigravity, Gemini CLI, Cursor, GitHub Copilot and other tools that support the format.

Time-sensitive content (versions, EoL, CVEs, PQC, AI tool capabilities and install paths) was verified as of **2026-09-27**.

> **Language note:** The skill content is written in Traditional Chinese and instructs the AI to answer in Traditional Chinese with Taiwan enterprise IT terminology by default. If you need answers in another language, state it explicitly in your request.

## Contents

- [Included skills](#included-skills)
- [Directory structure](#directory-structure)
- [Before you install](#before-you-install)
- [Common install commands](#common-install-commands)
- [Per-platform installation](#per-platform-installation)
- [Usage](#usage)
- [Updating](#updating)
- [Time-sensitive information](#time-sensitive-information)
- [Maintenance rules](#maintenance-rules)

## Included skills

| Skill | Scope |
|---|---|
| `senior-network-engineer` | Primary skill. Cross-vendor architecture and troubleshooting, packet/session analysis, HA/DR, CVE and version governance, PQC, CEH/CISSP security foundations, AI Agent/MCP governance, customer and vendor communication, HLD/LLD/MOP/RCA and training; routes questions to the subskills below |
| `palo-alto-architect` | PAN-OS NGFW, Panorama, Strata Cloud Manager, Prisma SASE, Cortex (XDR/XSIAM/XSOAR/AgentiX/Cortex Cloud), CVEs and PQC |
| `fortinet-security-fabric-architect` | FortiGate/FortiOS, FortiManager, FortiAnalyzer, SD-WAN, ZTNA, SSL VPN to IPsec migration, PSIRT and PQC/QKD |
| `cisco-network-dc-architect` | Catalyst, Nexus/Nexus Dashboard, ACI, VXLAN EVPN, Catalyst SD-WAN, 9800/CW9800 WLC, ISE, Secure Firewall, PSIRT and PQC/MACsec |
| `hpe-aruba-network-architect` | AOS-8/AOS-10, Instant AOS-8, HPE Aruba Networking Central, ClearPass, AOS-CX/AOS-Switch, HPE Security Bulletins and PPK/PQC |

## Directory structure

```text
.
├── README.md                             # Traditional Chinese (canonical)
├── README/                               # Translations (15 languages)
│   └── README.<lang>.md
├── bundle-manifest.json                  # Bundle name, version and skill list
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

## Before you install

1. **Install all five skills into the same folder.** The primary skill loads subskills through the relative path `../<subskill>/SKILL.md`, which only resolves when the five folders sit side by side.
2. **Do not rename the folders.** Most tools require the folder name to match the `name` in `SKILL.md` and may silently skip a skill when they differ.
3. **On upload-based platforms (Claude web/desktop, ChatGPT web), upload and enable all five.** Each skill is independent on these platforms. The Anthropic Help Center states that skills cannot explicitly reference other skills, but Claude automatically combines multiple skills when appropriate.
4. **Install once, share across tools.** `~/.agents/skills` is a cross-tool location read by Codex/ChatGPT desktop, Cursor, GitHub Copilot and Gemini CLI; Claude Code and Antigravity need their own directories.

## Common install commands

Clone this repository first, then run the commands from the repository root. Replace `$dest` / `DEST` with the path for your platform from the table in the next section.

**Windows (PowerShell)**

```powershell
git clone https://github.com/Scorpio-meow/senior-network-engineer-skill-bundle.git
Set-Location senior-network-engineer-skill-bundle

$dest = Join-Path $HOME '.agents/skills'      # Replace per platform
New-Item -ItemType Directory -Path $dest -Force | Out-Null

# Option 1: Copy (best compatibility; re-copy after each update)
Copy-Item ./skills/* $dest -Recurse -Force

# Option 2: Junctions (repository edits take effect immediately; only for tools that officially support links)
Get-ChildItem ./skills -Directory | ForEach-Object {
    New-Item -ItemType Junction -Path (Join-Path $dest $_.Name) -Target $_.FullName
}
```

**macOS / Linux**

```bash
git clone https://github.com/Scorpio-meow/senior-network-engineer-skill-bundle.git
cd senior-network-engineer-skill-bundle

DEST=~/.agents/skills        # Replace per platform
mkdir -p "$DEST"

# Option 1: Copy
cp -R skills/* "$DEST/"

# Option 2: Symlinks (only for tools that officially support links)
for d in "$PWD"/skills/*/; do ln -s "${d%/}" "$DEST/"; done
```

Creating links fails if a folder with the same name already exists at the destination; back up or remove the old version yourself first.

## Per-platform installation

### Quick reference

| Platform | Personal (global) path | Project path | Links supported | Manual invocation |
|---|---|---|---|---|
| Claude Code | `~/.claude/skills` | `.claude/skills` | Yes | `/senior-network-engineer` |
| Claude web/desktop | Upload ZIP (see below) | — | — | Type `/` and pick |
| ChatGPT desktop, Codex CLI/IDE | `~/.agents/skills` | `.agents/skills` | Yes | ChatGPT: `@`; Codex: `$senior-network-engineer` or `/skills` |
| ChatGPT web | Upload (see below) | — | — | Automatic or `@` |
| Antigravity 2.0 / IDE | `~/.gemini/config/skills` | `.agents/skills` | Not documented | `/senior-network-engineer` |
| Antigravity CLI | `~/.gemini/antigravity-cli/skills` | `.agents/skills` | Not documented | `/senior-network-engineer` |
| Gemini CLI | `~/.gemini/skills` or `~/.agents/skills` | `.gemini/skills` or `.agents/skills` | Yes | Automatic (`/skills list` to view) |
| Cursor | `~/.cursor/skills` or `~/.agents/skills` | `.cursor/skills` or `.agents/skills` | Not documented | Type `/` in Agent chat |
| GitHub Copilot (VS Code, CLI) | `~/.copilot/skills` or `~/.agents/skills` | `.github/skills` or `.agents/skills` | Not documented | `/senior-network-engineer` |
| Hermes Agent | `~/.hermes/skills/<category>` | `.hermes/skills` or `.agents/skills` | Not documented | `/senior-network-engineer` |

Every tool also loads a skill automatically when its description matches the task. For tools marked "Not documented", the official docs do not say whether links are supported; install by copying.

### Claude Code

```bash
DEST=~/.claude/skills        # For project scope use .claude/skills
```

- Copy or link using the common commands (links are explicitly supported in the official docs).
- Changes take effect automatically in the current session; if `~/.claude/skills` did not exist at startup, run `/reload-skills`.
- Type `/skills` to view loaded skills.
- `~/.claude/skills` applies only to local Claude Code, not to Cowork or cloud sessions.

### Claude (claude.ai web, desktop)

Available on paid plans (Pro, Max, Team, Enterprise).

1. Enable code execution: **Settings > Capabilities > Code execution and file creation**. On Team/Enterprise, an Owner must enable Skills and code execution in **Organization settings > Plugins & skills**.
2. Package each of the five skills as its own ZIP. The top level inside the ZIP must be the skill folder itself (for example `palo-alto-architect/SKILL.md`); do not put `SKILL.md` directly at the ZIP root.

   ```bash
   mkdir -p dist && cd skills
   for s in */; do zip -r "../dist/${s%/}.zip" "${s%/}"; done
   cd .. && unzip -l dist/senior-network-engineer.zip   # Every entry should start with senior-network-engineer/
   ```

   ```powershell
   # On Windows use PowerShell 7 (pwsh); Compress-Archive in Windows PowerShell 5.1 may produce incompatible path formats
   New-Item -ItemType Directory -Path dist -Force | Out-Null
   Get-ChildItem ./skills -Directory | ForEach-Object {
       Compress-Archive -Path $_.FullName -DestinationPath "dist/$($_.Name).zip" -Force
   }
   ```

3. Go to **Customize > Skills**, choose **+** → **Create skill** → **Upload a skill**, upload the five ZIPs one by one, and enable all of them.
4. Describe your task in a conversation to use them automatically, or type `/` in the input box to pick a skill.

**Description length limit:** The Claude Help Center states a 200-character limit for descriptions (the claude.com developer docs and the Agent Skills specification allow 1,024 characters). This bundle follows the stricter 200-character limit; the five descriptions are 161–177 characters each.

**Alternative: upload all five skills at once as a plugin** (Pro plan or higher). Claude plugins require a `.claude-plugin/plugin.json` manifest, which this repository does not include; generate it when packaging:

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

Then upload `dist/senior-network-engineer-bundle.zip` in **Customize > Plugins**.

### ChatGPT

**ChatGPT desktop:** Shares local skills with Codex; installing to `~/.agents/skills` is enough (see the next section). Type `@` in ChatGPT to pick a skill.

**ChatGPT web:** Limited to Business, Enterprise, Healthcare and Edu plans, and subject to workspace admin settings.

1. Choose **Plugins** in the sidebar.
2. In **Plugin Directory**, open the **Skills** tab.
3. Choose **Create** → **Upload from your computer** and upload the five skills one by one. ChatGPT scans each upload first; the result may show "Needs Review" or "Blocked".

OpenAI's official docs do not specify the upload file format. Try the per-skill ZIPs from the previous section first; if they are not accepted, adjust according to the instructions on the upload screen.

### OpenAI Codex (CLI, IDE extension)

```bash
DEST=~/.agents/skills        # For project scope use .agents/skills inside the repository
```

- Copy or link using the common commands (links are explicitly supported in the official docs).
- Codex detects skill changes automatically; restart Codex if they do not appear.
- Invoke with `$senior-network-engineer`, or run `/skills` to pick one.
- The old path `$CODEX_HOME/skills` (`~/.codex/skills` when `CODEX_HOME` is unset) has been removed from the official docs, but Codex still loads it as a deprecated path. If another copy of this bundle remains there, skills with the same name appear twice; remove the old installation.

### Google Antigravity (2.0, IDE, CLI)

```bash
DEST=~/.gemini/config/skills                # Antigravity 2.0 and IDE (global)
DEST=~/.gemini/antigravity-cli/skills       # Antigravity CLI (global)
DEST=<project-root>/.agents/skills          # Project scope shared by all three
```

- The three interfaces use different global paths. If you use both 2.0/IDE and the CLI, install to both global paths, or use the project-scoped `.agents/skills` instead.
- The IDE still supports the old path `~/.gemini/antigravity/skills`.
- Migrating from Gemini CLI: `~/.gemini/skills` maps to `~/.gemini/antigravity-cli/skills`; a project's `.gemini/skills` must be renamed or moved to `.agents/skills` manually.
- The CLI can also install via plugin: create a folder containing `plugin.json` and `skills/`, then run `agy plugin install <plugin-folder>`; type `/skills` in the TUI to view loaded skills.

### Gemini CLI

Gemini CLI stopped serving individual users on 2026-06-18 (replaced by Antigravity CLI). Only Gemini Code Assist Standard/Enterprise licenses and paid Gemini API keys can continue to use it.

```bash
DEST=~/.gemini/skills        # Or ~/.agents/skills; for project scope use .gemini/skills or .agents/skills
```

- You can also create links with the official command: `gemini skills link ./skills`.
- Run `/skills reload` in a session to load new skills, and `/skills list` to view them.
- File access to a skill's folder is granted only when the skill is activated; you may see a permission prompt when the primary skill reads a subskill.

### Cursor

```bash
DEST=~/.cursor/skills        # Or ~/.agents/skills; for project scope use .cursor/skills or .agents/skills
```

- Cursor discovers skills automatically at startup; view them in **Customize → Skills**.
- Invoke by typing `/` in Agent chat and picking a skill.
- Only `~/.cursor/skills` syncs to Cloud Agents (enable **Sync Skills for Cloud Agents** in **Settings → Agents**); `~/.agents/skills` does not sync to Cloud Agents or remote SSH.

### GitHub Copilot (VS Code agent mode, Copilot CLI)

```bash
DEST=~/.copilot/skills       # Or ~/.agents/skills; for project scope use .github/skills or .agents/skills
```

- If your Copilot license comes from an organization or enterprise, an admin must allow the relevant features in policy.
- VS Code: type `/skills` in Chat to open skill settings. Copilot CLI: `/skills list`, `/skills reload`.
- Copilot cloud agent and code review run on GitHub and only read skills inside the repository (project scope).

### Hermes Agent

```bash
DEST=~/.hermes/skills/network   # Put all five skills under the same category folder
```

- New skills take effect in a new session (or run `/reset`).
- A project's `.hermes/skills` and `.agents/skills` load only after you run `hermes skills trust` in that repository.
- If the skills are already installed in `~/.agents/skills`, add that path to `skills.external_dirs` in `~/.hermes/config.yaml` to share them.
- Installing one by one from GitHub with `hermes skills install` is not recommended: it only copies files directly referenced by `SKILL.md`, so cross-skill `../` references are not downloaded.

## Usage

Describe your task and the tool picks skills automatically based on their descriptions. To choose one explicitly, invoke it the way your platform supports (see the quick reference table). For example, in Codex:

```text
$senior-network-engineer Analyze this cross-vendor network incident. List the evidence and hypotheses first, then provide a MOP with a rollback plan. Please answer in English.
```

For single-vendor questions you can invoke a subskill directly, such as `palo-alto-architect`, `fortinet-security-fabric-architect`, `cisco-network-dc-architect` or `hpe-aruba-network-architect`.

## Updating

On the computer where you made changes:

```bash
git status --short
git add -- <files-you-actually-changed>
git commit -m "<single-purpose description>"
git push
```

On other computers:

```bash
git pull --ff-only
```

- Tools installed via links: changes take effect right after pulling.
- Tools installed by copying: re-run the copy command after pulling.
- Upload-based platforms (Claude, ChatGPT web): repackage and re-upload the skills that changed.

## Time-sensitive information

- Versions, EoL/EoS, CVEs, Recommended Releases, PQC support and AI tool capabilities are based on vendor or official documentation, with the verification date noted in the text.
- Skill paths and upload flows for AI tools change frequently. This document reflects official documentation as of 2026-09-27; if a skill does not load after installation, check the tool's latest documentation first.
- At verification time, the following items could only be found in third-party or community sources because the official pages require a vendor support portal login. The skill content marks them "re-verify before citing":
  - FortiNAC 9.4 EoS and FortiGate CNF End of Order dates (Fortinet Product Life Cycle, requires a FortiCare account)
  - AirWave software EoS and the end-of-sale status of 2930F/2930M/5400R (HPE Networking Support Portal)
- When updating time-sensitive content, also update the verification date in the relevant section and the `version` in `bundle-manifest.json`.

## Maintenance rules

- Edit the canonical skills only inside `skills/`; do not edit the copies at install locations.
- Keep the five skills at the same level; keep `SKILL.md` concise and under 500 lines, with details in one-level-deep `references/`.
- The frontmatter `name` must match the folder name; `description` must be at most 200 characters (to fit the Claude Help Center upload limit) and state both what the skill does and when to trigger it.
- Do not claim CVEs, fixed releases, EoL, PQC, CLI, licensing or AI platform features from memory; rely on vendor or official documentation and record the verification date.
- Do not commit customer configurations, PCAPs, accounts, passwords, PSKs, private keys, API tokens, licenses or ticket attachments.
- High-risk recommendations must include evidence, blast radius, stop conditions, rollback and validation.
- `README.md` (Traditional Chinese) is the canonical README. When changing it, update every `README/README.<lang>.md` translation in the same commit.
