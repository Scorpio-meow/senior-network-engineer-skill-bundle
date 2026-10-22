# Senior Network Engineer Skill Bundle

[繁體中文](../README.md) | [English](README.en.md) | [简体中文](README.zh-CN.md) | **粵語** | [日本語](README.ja.md) | [한국어](README.ko.md) | [Español](README.es.md) | [Português (Brasil)](README.pt-BR.md) | [Français](README.fr.md) | [Deutsch](README.de.md) | [Русский](README.ru.md) | [Tiếng Việt](README.vi.md) | [Bahasa Indonesia](README.id.md) | [ไทย](README.th.md) | [Türkçe](README.tr.md) | [العربية](README.ar.md)

個人用嘅資深網絡工程師 Skill 套件：一個跨廠牌主 Skill，加埋四個廠牌 subskill，全部集中喺同一個 Git repository，等多部電腦、多種 AI 工具都可以共用同一份正本。

Skill 採用 [Agent Skills 開放格式](https://agentskills.io/specification)（每個資料夾入面有 `SKILL.md` 同選用嘅 `references/`），可以安裝到 Claude、ChatGPT/Codex、Google Antigravity、Gemini CLI、Cursor、GitHub Copilot 等支援呢個格式嘅工具。

時效性內容（版本、EoL、CVE、PQC、AI 工具功能同安裝路徑）嘅查核基準日係 **2026-10-21**。

> **語言說明：** Skill 內容係用繁體中文寫嘅，並預設指示 AI 用繁體中文同台灣企業 IT 用語回答。如果你想用其他語言回答，請喺要求入面講明。

## 目錄

- [快速安裝](#快速安裝)
- [包含嘅 Skill](#包含嘅-skill)
- [目錄結構](#目錄結構)
- [安裝前要留意嘅嘢](#安裝前要留意嘅嘢)
- [通用安裝指令](#通用安裝指令)
- [各平台安裝](#各平台安裝)
- [使用方法](#使用方法)
- [更新](#更新)
- [時效性資訊](#時效性資訊)
- [維護規則](#維護規則)

## 快速安裝

用 [`skills`](https://github.com/vercel-labs/skills) 指令一行就裝晒五個 Skill，佢會偵測你部電腦上面嘅 AI 工具，再擺去對應嘅資料夾：

```bash
bunx skills add Scorpio-meow/senior-network-engineer-skill-bundle --skill '*' -g
```

- `--skill '*'` 一次過裝齊五個 Skill。主 Skill 用相對路徑讀取 subskill，唔好淨係裝其中幾個。
- `-g` 會裝去個人目錄（所有項目都用得）；拎走 `-g` 就只會裝去目前嘅項目。
- 如果只想裝畀特定工具，就加 `-a`，例如 `-a claude-code -a codex`；各個工具嘅值可以睇 [skills 嘅支援清單](https://github.com/vercel-labs/skills/blob/main/docs/agents.md)。加 `-y` 可以略過確認提示。
- 如果冇 [Bun](https://bun.sh)，將 `bunx` 換做 `npx` 都得（要 Node.js 22.20 或以上）。
- 裝畀多個工具嗰陣，`bunx skills` 會將 Skill 擺喺共用嘅 `~/.agents/skills/`（唔加 `-g` 就係項目入面嘅 `.agents/skills/`），再幫其他工具建立連結。
- `-a antigravity` 會裝去 IDE 嘅舊路徑 `~/.gemini/antigravity/skills/`；Antigravity App 請用[通用安裝指令](#通用安裝指令)裝去 `~/.gemini/config/skills`。其他工具裝完之後讀唔到嘅話，都改用手動安裝，擺去[各平台安裝](#各平台安裝)列出嘅資料夾。
- Claude 網頁版/桌面版同 ChatGPT 網頁版要上載 ZIP，唔適用呢個指令。

## 包含嘅 Skill

| Skill | 涵蓋範圍 |
|---|---|
| `senior-network-engineer` | 主 Skill。跨廠牌架構同排障、封包/session 分析、HA/DR、CVE 同版本管治、PQC、CEH/CISSP 網絡安全基礎、AI Agent/MCP 管治、客戶同原廠溝通、HLD/LLD/MOP/RCA 同培訓；按問題路由去下面嘅 subskill |
| `palo-alto-architect` | PAN-OS NGFW、Panorama、Strata Cloud Manager、Prisma SASE、Cortex（XDR/XSIAM/XSOAR/AgentiX/Cortex Cloud）、CVE 同 PQC |
| `fortinet-security-fabric-architect` | FortiGate/FortiOS、FortiManager、FortiAnalyzer、SD-WAN、ZTNA、SSL VPN 轉 IPsec 遷移、PSIRT 同 PQC/QKD |
| `cisco-network-dc-architect` | Catalyst、Nexus/Nexus Dashboard、ACI、VXLAN EVPN、Catalyst SD-WAN、9800/CW9800 WLC、ISE、Secure Firewall、PSIRT 同 PQC/MACsec |
| `hpe-aruba-network-architect` | AOS-8/AOS-10、Instant AOS-8、HPE Aruba Networking Central、ClearPass、AOS-CX/AOS-Switch、HPE Security Bulletin 同 PPK/PQC |

## 目錄結構

```text
.
├── README.md                             # 繁體中文（正本）
├── README/                               # 翻譯版（15 種語言）
│   └── README.<lang>.md
├── bundle-manifest.json                  # 套件名稱、版本同 Skill 清單
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

## 安裝前要留意嘅嘢

1. **五個 Skill 要一齊裝喺同一個資料夾。** 主 Skill 用相對路徑 `../<subskill>/SKILL.md` 載入 subskill，一定要五個資料夾並排擺先搵得到。
2. **唔好改資料夾名。** 大部分工具要求資料夾名同 `SKILL.md` 入面嘅 `name` 一致，唔一致嘅話可能會直接略過、唔載入。
3. **用上載方式安裝嘅平台（Claude 網頁版/桌面版、ChatGPT 網頁版），五個都要上載同啟用。** 呢類平台每個 Skill 各自獨立，主 Skill 冇辦法用 `../` 相對路徑讀取其他 Skill；五個都啟用之後，平台會根據各個 Skill 嘅 description 揀用對應嘅 subskill。
4. **裝一次、多個工具共用。** `~/.agents/skills` 係跨工具嘅共用位置，Codex/ChatGPT 桌面版、Cursor、GitHub Copilot、Gemini CLI 都會讀取；Claude Code 同 Antigravity 就要裝去佢哋各自嘅目錄。
5. **避免重複安裝。** Cursor 同 GitHub Copilot（VS Code）亦會讀取 `~/.claude/skills`；如果同時裝咗喺 `~/.claude/skills` 同 `~/.agents/skills`，呢啲工具可能會顯示兩份同名 Skill。

## 通用安裝指令

先 clone 呢個 repository，然後喺 repository 根目錄執行。將 `$dest`／`DEST` 換做下一節各平台對照表入面嘅路徑。

**Windows（PowerShell）**

```powershell
git clone https://github.com/Scorpio-meow/senior-network-engineer-skill-bundle.git
Set-Location senior-network-engineer-skill-bundle

$dest = Join-Path $HOME '.agents/skills'      # 按平台替換
New-Item -ItemType Directory -Path $dest -Force | Out-Null

# 方式一：複製（兼容性最好；每次更新之後要重新複製）
Copy-Item ./skills/* $dest -Recurse -Force

# 方式二：建立 Junction（repository 一改即刻生效；只適用於官方註明支援連結嘅工具）
Get-ChildItem ./skills -Directory | ForEach-Object {
    New-Item -ItemType Junction -Path (Join-Path $dest $_.Name) -Target $_.FullName
}
```

**macOS / Linux**

```bash
git clone https://github.com/Scorpio-meow/senior-network-engineer-skill-bundle.git
cd senior-network-engineer-skill-bundle

DEST=~/.agents/skills        # 按平台替換
mkdir -p "$DEST"

# 方式一：複製
cp -R skills/* "$DEST/"

# 方式二：符號連結（只適用於官方註明支援連結嘅工具）
for d in "$PWD"/skills/*/; do ln -s "${d%/}" "$DEST/"; done
```

目標位置已經有同名資料夾嘅話，建立連結會失敗；請自己先備份或者移除舊版本。

## 各平台安裝

### 快速對照

| 平台 | 個人（全域）路徑 | 項目路徑 | 支援連結 | 手動呼叫 |
|---|---|---|---|---|
| Claude Code | `~/.claude/skills` | `.claude/skills` | 係 | `/senior-network-engineer` |
| Claude 網頁版/桌面版 | 上載 ZIP（睇下面） | — | — | 自動（plugin 可以輸入 `/`） |
| ChatGPT 桌面版、Codex CLI/IDE | `~/.agents/skills` | `.agents/skills` | 係 | ChatGPT：`@`；Codex：`$senior-network-engineer` 或者 `/skills` |
| ChatGPT 網頁版 | 上載（睇下面） | — | — | 自動或者 `@` |
| Antigravity App / IDE | `~/.gemini/config/skills` | `.agents/skills` | 冇記載 | `/senior-network-engineer` |
| Antigravity CLI | `~/.gemini/antigravity-cli/skills` | `.agents/skills` | 冇記載 | `/senior-network-engineer` |
| Gemini CLI | `~/.gemini/skills` 或者 `~/.agents/skills` | `.gemini/skills` 或者 `.agents/skills` | 係 | 自動（用 `/skills list` 睇） |
| Cursor | `~/.cursor/skills` 或者 `~/.agents/skills` | `.cursor/skills` 或者 `.agents/skills` | 冇記載 | 喺 Agent chat 輸入 `/` |
| GitHub Copilot（VS Code、CLI） | `~/.copilot/skills` 或者 `~/.agents/skills` | `.github/skills`、`.agents/skills` 或者 `.claude/skills` | 冇記載 | `/senior-network-engineer` |
| Hermes Agent | `~/.hermes/skills/<分類>` | `.hermes/skills` 或者 `.agents/skills` | 冇記載 | `/senior-network-engineer` |

所有工具喺 description 同任務吻合嘅時候，都會自動載入 Skill。標示「冇記載」嘅工具，官方文件冇講明支唔支援連結，建議用複製方式安裝。

### Claude Code

```bash
DEST=~/.claude/skills        # 項目範圍改用 .claude/skills
```

- 用通用指令複製或者建立連結（官方文件明確支援連結）。
- 修改會喺目前嘅 session 入面自動生效；如果 `~/.claude/skills` 係 session 啟動之後先建立，呢個目錄唔會被監察，之後每次修改都要執行 `/reload-skills`。
- 輸入 `/skills` 可以睇已載入嘅 Skill。
- `~/.claude/skills` 只係作用於本機嘅 Claude Code，唔包括 Cowork 同雲端 session。

### Claude（claude.ai 網頁版、桌面版）

Free、Pro、Max、Team、Enterprise 計劃都可以用 Skills（要開啟程式碼執行）；plugin 上載只限 Pro 或以上計劃。

1. 開啟程式碼執行：**Settings > Capabilities > Code execution and file creation**。Team/Enterprise 由 Owner 喺 **Organization settings > Plugins & skills > Policy** 開啟 **Cloud code execution and file creation** 同 **Skills**（Team 預設開咗，Enterprise 要手動開啟）。
2. 將五個 Skill 逐個打包做 ZIP。ZIP 入面最上層一定要係 Skill 資料夾本身（例如 `palo-alto-architect/SKILL.md`），唔可以將 `SKILL.md` 直接擺喺 ZIP 根目錄。

   ```bash
   mkdir -p dist && cd skills
   for s in */; do zip -r "../dist/${s%/}.zip" "${s%/}"; done
   cd .. && unzip -l dist/senior-network-engineer.zip   # 每一行都應該以 senior-network-engineer/ 開頭
   ```

   ```powershell
   # Windows 請用 PowerShell 7（pwsh）執行，Windows PowerShell 5.1 嘅 Compress-Archive 產生嘅路徑格式可能唔兼容
   New-Item -ItemType Directory -Path dist -Force | Out-Null
   Get-ChildItem ./skills -Directory | ForEach-Object {
       Compress-Archive -Path $_.FullName -DestinationPath "dist/$($_.Name).zip" -Force
   }
   ```

3. 去 **Customize > Skills**，揀 **+** → **Create skill** → **Upload a skill**，逐個上載五個 ZIP，然後全部開啟。Enterprise 由 2026-10-02 起預設會對上載內容做安全掃描（Pass/Warn/Fail），結果係 Fail 嘅話就上載唔到。
4. 喺對話入面描述任務就會自動使用；用 plugin 安裝嘅話，亦可以喺輸入框輸入 `/` 揀。

**description 長度限制**：Claude 說明中心寫明 description 上限係 200 字元（claude.com 開發者文件同 Agent Skills 規格係 1,024 字元）。呢個套件跟較嚴格嘅 200 字元嚟寫，五個 description 都係 161–177 字元。

**替代方式：用 plugin 一次過上載五個 Skill**（Pro 或以上計劃）。Claude 嘅 plugin 需要 `.claude-plugin/plugin.json` 清單檔，呢個 repository 冇內置，可以喺打包嗰陣產生：

```bash
mkdir -p dist/snet-plugin/.claude-plugin
cp -R skills dist/snet-plugin/
cat > dist/snet-plugin/.claude-plugin/plugin.json <<'EOF'
{
  "name": "senior-network-engineer-bundle",
  "description": "Senior network engineer skills for Palo Alto, Fortinet, Cisco and HPE Aruba",
  "version": "2026.10.21"
}
EOF
(cd dist/snet-plugin && zip -r ../senior-network-engineer-bundle.zip .)
```

然後去 **Customize > Plugins** 上載 `dist/senior-network-engineer-bundle.zip`。

### ChatGPT

**ChatGPT 桌面版**：同 Codex 共用本機 Skill，裝去 `~/.agents/skills` 就得（睇下一節）。喺 ChatGPT 入面輸入 `@` 揀 Skill。

**ChatGPT 網頁版**：只限 Business、Enterprise、Healthcare、Edu 計劃，並受工作區管理設定控制（Enterprise 同 Edu 預設關閉，要管理員開啟）。個人 Skill 唔會喺桌面版同網頁版/流動版之間同步。

1. 喺側邊欄揀 **Plugins**。
2. 喺 **Plugin Directory** 揀 **Skills** 分頁。
3. 揀 **Create** → **Upload from your computer**，逐個上載五個 Skill。ChatGPT 會先掃描，結果可能顯示「Needs Review」或者「Blocked」。

OpenAI 官方文件冇講明上載嘅檔案格式；可以先試上一節嘅單一 Skill ZIP，如果唔接受，再按上載畫面嘅說明調整。

### OpenAI Codex（CLI、IDE extension）

```bash
DEST=~/.agents/skills        # 項目範圍改用 repository 入面嘅 .agents/skills
```

- 用通用指令複製或者建立連結（官方文件明確支援連結）。
- Codex 會自動偵測 Skill 變更；冇出現嘅話就重新啟動 Codex。
- 呼叫：`$senior-network-engineer`，或者執行 `/skills` 再揀。
- 舊路徑 `$CODEX_HOME/skills`（未設定 `CODEX_HOME` 時係 `~/.codex/skills`）已經喺官方文件移除，但 Codex 仍然會當佢係 deprecated 路徑載入。如果舊路徑仲有呢個套件嘅另一份檔案，同名 Skill 會出現兩次，請移除舊安裝。

### Google Antigravity（App、IDE、CLI）

```bash
DEST=~/.gemini/config/skills                # Antigravity App 同 IDE（全域）
DEST=~/.gemini/antigravity-cli/skills       # Antigravity CLI（全域）
DEST=<項目根目錄>/.agents/skills            # 三者共用嘅項目範圍
```

- 三種介面嘅全域路徑唔同；如果同時用 App/IDE 同 CLI，兩個全域路徑都要裝，或者改用項目範圍嘅 `.agents/skills`。
- IDE 仍然支援舊路徑 `~/.gemini/antigravity/skills`。
- 由 Gemini CLI 遷移：`~/.gemini/skills` 對應 `~/.gemini/antigravity-cli/skills`；項目入面嘅 `.gemini/skills` 要手動改名或者搬去 `.agents/skills`；Gemini CLI extension 可以用 `agy plugin import gemini` 轉換。
- CLI 亦可以用 plugin 安裝：建立一個有 `plugin.json` 同 `skills/` 嘅資料夾，之後執行 `agy plugin install <plugin 資料夾>`；喺 TUI 入面輸入 `/plugin` 管理 plugin，Skill 用 `/<skill 名稱>` 呼叫。

### Gemini CLI

Gemini CLI 由 2026-06-18 起停止為個人用戶提供服務（改用 Antigravity CLI），而家只有付費 Gemini API key 同仲喺合約期內嘅 Gemini Code Assist Standard/Enterprise 可以繼續使用；Code Assist Standard/Enterprise 已經喺 2026-10-09 停止新購，Google 建議改用 Antigravity。

```bash
DEST=~/.gemini/skills        # 或者 ~/.agents/skills；項目範圍用 .gemini/skills 或者 .agents/skills
```

- 亦可以用官方指令建立連結：`gemini skills link ./skills`。
- 喺 session 入面執行 `/skills reload` 載入新 Skill，`/skills list` 睇清單。
- Skill 啟用咗先會開放佢資料夾嘅檔案存取；主 Skill 讀取 subskill 嗰陣可能會彈出授權提示。

### Cursor

```bash
DEST=~/.cursor/skills        # 或者 ~/.agents/skills；項目範圍用 .cursor/skills 或者 .agents/skills
```

- Cursor 啟動嗰陣會自動探索 Skill；喺 **Customize → Skills** 睇。Cursor 亦會讀取 `~/.claude/skills`、`~/.codex/skills` 同項目入面嘅 `.claude/skills`、`.codex/skills`，留意唔好重複安裝。
- 呼叫：喺 Agent chat 輸入 `/` 揀 Skill。
- 只有 `~/.cursor/skills` 會同步去 Cloud Agents（要喺 **Settings → Agents** 開啟 **Sync Skills for Cloud Agents**）；`~/.agents/skills` 唔會同步去 Cloud Agents 或者遠端 SSH。

### GitHub Copilot（VS Code agent mode、Copilot CLI）

```bash
DEST=~/.copilot/skills       # 或者 ~/.agents/skills；項目範圍用 .github/skills、.agents/skills 或者 .claude/skills
```

- 如果係透過機構或者企業攞到 Copilot 授權，部分功能受管理員政策控制。
- VS Code：Chat view 揀 **Local** 嗰陣可以輸入 `/skills` 開啟 Skill 設定，用 Copilot 等其他 harness 嗰陣就改用 **Open Customizations**；VS Code 亦會讀取 `~/.claude/skills`。Copilot CLI：`/skills list`、`/skills reload`。
- Copilot cloud agent 同 code review 喺 GitHub 上面執行，只會讀取 repository 入面（項目範圍）嘅 Skill。

### Hermes Agent

```bash
DEST=~/.hermes/skills/network   # 五個 Skill 擺喺同一個分類資料夾下面
```

- 對話期間新增或者移除 Skill，下一條訊息會帶埋通知；執行 `/reload-skills` 可以重新掃描 `~/.hermes/skills/`，並更新 `/<skill 名稱>` 指令。
- 項目入面嘅 `.hermes/skills`、`.agents/skills`，要喺嗰個 repository 執行咗 `hermes skills trust` 先會載入。
- 如果已經裝咗喺 `~/.agents/skills`，可以喺 `~/.hermes/config.yaml` 嘅 `skills.external_dirs` 加入呢個路徑嚟共用。Hermes 會自行更新 Skill；如果呢個路徑可以寫入而且連結到呢個 repository，佢可能會直接改到正本，建議用複製方式安裝或者設定唯讀權限。
- 唔建議用 `hermes skills install` 逐個由 GitHub 安裝：佢只會複製 `SKILL.md` 直接引用嘅檔案，跨 Skill 嘅 `../` 引用唔會一併下載。

## 使用方法

直接描述任務，工具會根據 description 自動揀用 Skill；需要指定嘅話，就用各平台嘅方式手動呼叫（睇快速對照表）。例如喺 Codex：

```text
$senior-network-engineer 請分析呢個跨廠牌網絡異常，先列出證據同假設，再提供可以回滾嘅 MOP。請用廣東話回答。
```

單一廠牌嘅問題可以直接呼叫 subskill，例如 `palo-alto-architect`、`fortinet-security-fabric-architect`、`cisco-network-dc-architect` 或者 `hpe-aruba-network-architect`。

## 更新

喺改咗內容嘅電腦上面：

```bash
git status --short
git add -- <實際改咗嘅檔案>
git commit -m "<單一目的嘅說明>"
git push
```

喺其他電腦：

```bash
git pull --ff-only
```

- 用連結安裝嘅工具：pull 完即刻生效。
- 用複製安裝嘅工具：pull 完重新執行複製指令。
- 用上載安裝嘅平台（Claude、ChatGPT 網頁版）：重新打包，再上載有變更嘅 Skill。
- 用 `bunx skills` 安裝嘅工具：執行 `bunx skills update -g` 更新（來源係 GitHub 上面嘅預設分支；`bunx skills check` 只會檢查、唔會更新）。要移除就執行 `bunx skills remove -g Scorpio-meow/senior-network-engineer-skill-bundle`，五個 Skill 會一齊移除。安裝嗰陣冇加 `-g` 嘅話，呢兩個指令都要拎走 `-g`。

## 時效性資訊

- 版本、EoL/EoS、CVE、Recommended Release、PQC 支援同 AI 工具功能，一律以原廠或者官方文件為準，並喺內文標明查核日期。
- 各 AI 工具嘅 Skill 路徑同上載流程成日變，本文件係根據 2026-10-21 嘅官方文件整理；如果安裝之後冇載入，請先查閱該工具最新嘅文件。
- 以下資料喺查核嗰陣只搵到第三方或者社群來源，因為官方頁面要登入原廠支援入口先睇到；Skill 內文已經標註「引用前重查」：
  - FortiNAC 9.4 EoS 同 FortiGate CNF End of Order 日期（Fortinet Product Life Cycle，需要 FortiCare 帳戶）
  - AirWave 軟件 EoS 同 2930F/2930M/5400R 停售狀態（HPE Networking Support Portal）
  - 3810M 停售同停止支援日期（Aruba 2022-11 官方公告係 2023-06-30／2028-06-30，第三方資料顯示改咗做 2025／2030，要以 HPE lifecycle portal 確認）
- 更新時效性內容嘅時候，要同步更新對應段落嘅查核日期同 `bundle-manifest.json` 嘅 `version`。

## 維護規則

- 只喺 `skills/` 入面修改 Skill 正本；唔好直接改安裝位置嘅複製版本。
- 保持五個 Skill 喺同一層；`SKILL.md` 要保持精簡，少過 500 行，細節擺入一層深嘅 `references/`。
- Frontmatter `name` 一定要同資料夾名一致；`description` 唔可以超過 200 字元（配合 Claude 說明中心嘅上載限制），並且要同時寫明功能同觸發時機。
- 唔好憑記憶宣稱 CVE、fixed release、EoL、PQC、CLI、license 或者 AI 平台功能；要以原廠或者官方文件為準，並寫明查核日期。
- 唔好提交客戶設定、PCAP、帳戶、密碼、PSK、私鑰、API token、license 或者工單附件。
- 高風險建議一定要包括證據、blast radius、停止條件、回滾同驗證。
- `README.md`（繁體中文）係 README 正本；修改嘅時候，請喺同一個 commit 同步更新所有 `README/README.<lang>.md` 翻譯版。
