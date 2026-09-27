# Senior Network Engineer Skill Bundle

個人使用的資深網路工程師 Skill 套件：一個跨廠牌主 Skill 加上四個廠牌 subskill，集中在同一個 Git repository，讓多台電腦、多種 AI 工具共用同一份正本。

Skill 採用 [Agent Skills 開放格式](https://agentskills.io/specification)（資料夾內含 `SKILL.md` 與選用的 `references/`），可安裝到 Claude、ChatGPT/Codex、Google Antigravity、Gemini CLI、Cursor、GitHub Copilot 等支援此格式的工具。

時效性內容（版本、EoL、CVE、PQC、AI 工具能力與安裝路徑）的查核基準日為 **2026-09-27**。

## 目錄

- [包含的 Skill](#包含的-skill)
- [目錄結構](#目錄結構)
- [安裝前須知](#安裝前須知)
- [通用安裝指令](#通用安裝指令)
- [各平台安裝](#各平台安裝)
- [使用方式](#使用方式)
- [更新](#更新)
- [時效性資訊](#時效性資訊)
- [維護規則](#維護規則)

## 包含的 Skill

| Skill | 涵蓋範圍 |
|---|---|
| `senior-network-engineer` | 主 Skill。跨廠牌架構與排障、封包/session 分析、HA/DR、CVE 與版本治理、PQC、CEH/CISSP 資安基礎、AI Agent/MCP 治理、客戶與原廠溝通、HLD/LLD/MOP/RCA 與教育訓練；依問題路由至下列 subskill |
| `palo-alto-architect` | PAN-OS NGFW、Panorama、Strata Cloud Manager、Prisma SASE、Cortex（XDR/XSIAM/XSOAR/AgentiX/Cortex Cloud）、CVE 與 PQC |
| `fortinet-security-fabric-architect` | FortiGate/FortiOS、FortiManager、FortiAnalyzer、SD-WAN、ZTNA、SSL VPN 至 IPsec 遷移、PSIRT 與 PQC/QKD |
| `cisco-network-dc-architect` | Catalyst、Nexus/Nexus Dashboard、ACI、VXLAN EVPN、Catalyst SD-WAN、9800/CW9800 WLC、ISE、Secure Firewall、PSIRT 與 PQC/MACsec |
| `hpe-aruba-network-architect` | AOS-8/AOS-10、Instant AOS-8、HPE Aruba Networking Central、ClearPass、AOS-CX/AOS-Switch、HPE Security Bulletin 與 PPK/PQC |

## 目錄結構

```text
.
├── README.md
├── bundle-manifest.json                  # 套件名稱、版本與 Skill 清單
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

## 安裝前須知

1. **五個 Skill 一起安裝到同一個資料夾。** 主 Skill 以相對路徑 `../<subskill>/SKILL.md` 載入 subskill，只有五個資料夾並排時才找得到。
2. **不要改資料夾名稱。** 多數工具要求資料夾名稱與 `SKILL.md` 的 `name` 一致，不一致時可能直接略過不載入。
3. **以上傳方式安裝的平台（Claude 網頁版/桌面版、ChatGPT 網頁版）五個都要上傳並啟用。** 這類平台每個 Skill 各自獨立，Anthropic 說明中心表示 Skill 無法明確引用其他 Skill，但 Claude 會自動搭配多個 Skill 使用。
4. **一次安裝、多工具共用。** `~/.agents/skills` 是跨工具的共用位置，Codex/ChatGPT 桌面版、Cursor、GitHub Copilot、Gemini CLI 都會讀取；Claude Code 與 Antigravity 則需要安裝到各自的目錄。

## 通用安裝指令

先 clone 本 repository，然後在 repository 根目錄執行。把 `$dest`／`DEST` 換成下一節各平台對照表中的路徑。

**Windows（PowerShell）**

```powershell
git clone https://github.com/JoeChin0416/senior-network-engineer-skill-bundle.git
Set-Location senior-network-engineer-skill-bundle

$dest = Join-Path $HOME '.agents/skills'      # 依平台替換
New-Item -ItemType Directory -Path $dest -Force | Out-Null

# 方式一：複製（相容性最好；更新後需重新複製）
Copy-Item ./skills/* $dest -Recurse -Force

# 方式二：建立 Junction（repository 修改立即生效；僅適用官方標明支援連結的工具）
Get-ChildItem ./skills -Directory | ForEach-Object {
    New-Item -ItemType Junction -Path (Join-Path $dest $_.Name) -Target $_.FullName
}
```

**macOS / Linux**

```bash
git clone https://github.com/JoeChin0416/senior-network-engineer-skill-bundle.git
cd senior-network-engineer-skill-bundle

DEST=~/.agents/skills        # 依平台替換
mkdir -p "$DEST"

# 方式一：複製
cp -R skills/* "$DEST/"

# 方式二：符號連結（僅適用官方標明支援連結的工具）
for d in "$PWD"/skills/*/; do ln -s "${d%/}" "$DEST/"; done
```

目標位置已有同名資料夾時，建立連結會失敗；請先自行備份或移除舊版本。

## 各平台安裝

### 快速對照

| 平台 | 個人（全域）路徑 | 專案路徑 | 支援連結 | 手動呼叫 |
|---|---|---|---|---|
| Claude Code | `~/.claude/skills` | `.claude/skills` | 是 | `/senior-network-engineer` |
| Claude 網頁版/桌面版 | 上傳 ZIP（見下方） | — | — | 輸入 `/` 選擇 |
| ChatGPT 桌面版、Codex CLI/IDE | `~/.agents/skills` | `.agents/skills` | 是 | ChatGPT：`@`；Codex：`$senior-network-engineer` 或 `/skills` |
| ChatGPT 網頁版 | 上傳（見下方） | — | — | 自動或 `@` |
| Antigravity 2.0 / IDE | `~/.gemini/config/skills` | `.agents/skills` | 未記載 | `/senior-network-engineer` |
| Antigravity CLI | `~/.gemini/antigravity-cli/skills` | `.agents/skills` | 未記載 | `/senior-network-engineer` |
| Gemini CLI | `~/.gemini/skills` 或 `~/.agents/skills` | `.gemini/skills` 或 `.agents/skills` | 是 | 自動（`/skills list` 檢視） |
| Cursor | `~/.cursor/skills` 或 `~/.agents/skills` | `.cursor/skills` 或 `.agents/skills` | 未記載 | 在 Agent chat 輸入 `/` |
| GitHub Copilot（VS Code、CLI） | `~/.copilot/skills` 或 `~/.agents/skills` | `.github/skills` 或 `.agents/skills` | 未記載 | `/senior-network-engineer` |
| Hermes Agent | `~/.hermes/skills/<分類>` | `.hermes/skills` 或 `.agents/skills` | 未記載 | `/senior-network-engineer` |

所有工具在描述符合時也會自動載入 Skill。標示「未記載」的工具，官方文件沒有說明是否支援連結，建議用複製安裝。

### Claude Code

```bash
DEST=~/.claude/skills        # 專案範圍改用 .claude/skills
```

- 使用通用指令複製或建立連結（官方文件明確支援連結）。
- 修改會在目前 session 內自動生效；若 `~/.claude/skills` 在啟動時還不存在，執行 `/reload-skills`。
- 輸入 `/skills` 可檢視已載入的 Skill。
- `~/.claude/skills` 只作用於本機的 Claude Code，不包含 Cowork 與雲端 session。

### Claude（claude.ai 網頁版、桌面版）

適用付費方案（Pro、Max、Team、Enterprise）。

1. 開啟程式碼執行：**Settings > Capabilities > Code execution and file creation**。Team/Enterprise 需由 Owner 在 **Organization settings > Plugins & skills** 開啟 Skills 與程式碼執行。
2. 將五個 Skill 各自打包成 ZIP。ZIP 內的最上層必須是 Skill 資料夾本身（例如 `palo-alto-architect/SKILL.md`），不能把 `SKILL.md` 直接放在 ZIP 根目錄。

   ```bash
   mkdir -p dist && cd skills
   for s in */; do zip -r "../dist/${s%/}.zip" "${s%/}"; done
   cd .. && unzip -l dist/senior-network-engineer.zip   # 每一行都應以 senior-network-engineer/ 開頭
   ```

   ```powershell
   # Windows 請用 PowerShell 7（pwsh）執行，Windows PowerShell 5.1 的 Compress-Archive 產生的路徑格式可能不相容
   New-Item -ItemType Directory -Path dist -Force | Out-Null
   Get-ChildItem ./skills -Directory | ForEach-Object {
       Compress-Archive -Path $_.FullName -DestinationPath "dist/$($_.Name).zip" -Force
   }
   ```

3. 前往 **Customize > Skills**，選 **+** → **Create skill** → **Upload a skill**，依序上傳五個 ZIP，並全部開啟。
4. 在對話中描述任務即可自動使用，或在輸入框輸入 `/` 選擇 Skill。

**description 長度限制**：Claude 說明中心寫 description 上限為 200 字元（claude.com 開發者文件與 Agent Skills 規格為 1,024 字元）。本套件依較嚴格的 200 字元撰寫，五個 description 皆為 161–177 字元。

**替代方式：以 plugin 一次上傳五個 Skill**（Pro 以上方案）。Claude 的 plugin 需要 `.claude-plugin/plugin.json` 清單檔，本 repository 未內建，可在打包時產生：

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

再到 **Customize > Plugins** 上傳 `dist/senior-network-engineer-bundle.zip`。

### ChatGPT

**ChatGPT 桌面版**：與 Codex 共用本機 Skill，安裝到 `~/.agents/skills` 即可（見下一節）。在 ChatGPT 中輸入 `@` 選擇 Skill。

**ChatGPT 網頁版**：限 Business、Enterprise、Healthcare、Edu 方案，並受工作區管理設定控制。

1. 在側邊欄選 **Plugins**。
2. 在 **Plugin Directory** 選 **Skills** 分頁。
3. 選 **Create** → **Upload from your computer**，逐一上傳五個 Skill。ChatGPT 會先掃描，結果可能顯示「Needs Review」或「Blocked」。

OpenAI 官方文件未說明上傳的檔案格式；可先嘗試上一節的單一 Skill ZIP，若不被接受，再依上傳畫面的說明調整。

### OpenAI Codex（CLI、IDE extension）

```bash
DEST=~/.agents/skills        # 專案範圍改用 repository 內的 .agents/skills
```

- 使用通用指令複製或建立連結（官方文件明確支援連結）。
- Codex 會自動偵測 Skill 變更；沒有出現時重新啟動 Codex。
- 呼叫：`$senior-network-engineer`，或執行 `/skills` 選擇。
- 舊路徑 `$CODEX_HOME/skills`（未設定 `CODEX_HOME` 時為 `~/.codex/skills`）已從官方文件移除，但 Codex 仍會以 deprecated 路徑載入。若舊路徑還有本套件的另一份檔案，同名 Skill 會出現兩次，請移除舊安裝。

### Google Antigravity（2.0、IDE、CLI）

```bash
DEST=~/.gemini/config/skills                # Antigravity 2.0 與 IDE（全域）
DEST=~/.gemini/antigravity-cli/skills       # Antigravity CLI（全域）
DEST=<專案根目錄>/.agents/skills            # 三者共用的專案範圍
```

- 三種介面的全域路徑不同；同時使用 2.0/IDE 與 CLI 時，兩個全域路徑都要安裝，或改用專案範圍的 `.agents/skills`。
- IDE 仍支援舊路徑 `~/.gemini/antigravity/skills`。
- 從 Gemini CLI 遷移：`~/.gemini/skills` 對應到 `~/.gemini/antigravity-cli/skills`；專案內的 `.gemini/skills` 需手動改名或移到 `.agents/skills`。
- CLI 也可用 plugin 安裝：建立含 `plugin.json` 與 `skills/` 的資料夾後執行 `agy plugin install <plugin 資料夾>`；在 TUI 中輸入 `/skills` 檢視已載入的 Skill。

### Gemini CLI

Gemini CLI 自 2026-06-18 起停止服務個人使用者（改用 Antigravity CLI），目前僅 Gemini Code Assist Standard/Enterprise 授權與付費 Gemini API key 可繼續使用。

```bash
DEST=~/.gemini/skills        # 或 ~/.agents/skills；專案範圍用 .gemini/skills 或 .agents/skills
```

- 也可用官方指令建立連結：`gemini skills link ./skills`。
- 在 session 中執行 `/skills reload` 載入新 Skill，`/skills list` 檢視清單。
- Skill 啟用時才會開放其資料夾的檔案存取；主 Skill 讀取 subskill 時可能會出現授權提示。

### Cursor

```bash
DEST=~/.cursor/skills        # 或 ~/.agents/skills；專案範圍用 .cursor/skills 或 .agents/skills
```

- Cursor 啟動時自動探索 Skill；在 **Customize → Skills** 檢視。
- 呼叫：在 Agent chat 輸入 `/` 選擇 Skill。
- 只有 `~/.cursor/skills` 會同步到 Cloud Agents（需在 **Settings → Agents** 開啟 **Sync Skills for Cloud Agents**）；`~/.agents/skills` 不會同步到 Cloud Agents 或遠端 SSH。

### GitHub Copilot（VS Code agent mode、Copilot CLI）

```bash
DEST=~/.copilot/skills       # 或 ~/.agents/skills；專案範圍用 .github/skills 或 .agents/skills
```

- 透過組織或企業取得 Copilot 授權時，需管理員在政策中允許相關功能。
- VS Code：在 Chat 輸入 `/skills` 開啟 Skill 設定；Copilot CLI：`/skills list`、`/skills reload`。
- Copilot cloud agent 與 code review 在 GitHub 上執行，只會讀取 repository 內（專案範圍）的 Skill。

### Hermes Agent

```bash
DEST=~/.hermes/skills/network   # 五個 Skill 放在同一個分類資料夾下
```

- 新 Skill 在新 session 生效（或執行 `/reset`）。
- 專案內的 `.hermes/skills`、`.agents/skills` 需先在該 repository 執行 `hermes skills trust` 才會載入。
- 已安裝在 `~/.agents/skills` 時，可在 `~/.hermes/config.yaml` 的 `skills.external_dirs` 加入該路徑共用。
- 不建議用 `hermes skills install` 逐一從 GitHub 安裝：它只複製 `SKILL.md` 直接引用的檔案，跨 Skill 的 `../` 引用不會一併下載。

## 使用方式

直接描述任務，工具會依 description 自動選用 Skill；需要指定時，以各平台的方式手動呼叫（見快速對照表）。例如在 Codex：

```text
$senior-network-engineer 請分析這個跨廠牌網路異常，先列證據與假設，再提供可回滾的 MOP。
```

單一廠牌問題可直接呼叫 subskill，例如 `palo-alto-architect`、`fortinet-security-fabric-architect`、`cisco-network-dc-architect` 或 `hpe-aruba-network-architect`。

## 更新

在修改內容的電腦：

```bash
git status --short
git add -- <實際修改的檔案>
git commit -m "<單一目的的說明>"
git push
```

在其他電腦：

```bash
git pull --ff-only
```

- 以連結安裝的工具：pull 後立即生效。
- 以複製安裝的工具：pull 後重新執行複製指令。
- 以上傳安裝的平台（Claude、ChatGPT 網頁版）：重新打包並上傳有變更的 Skill。

## 時效性資訊

- 版本、EoL/EoS、CVE、Recommended Release、PQC 支援與 AI 工具能力都以原廠或官方文件為準，並在內文標示查核日期。
- 各 AI 工具的 Skill 路徑與上傳流程變動頻繁，本文件依 2026-09-27 的官方文件整理；若安裝後未載入，請先查閱該工具最新文件。
- 下列資料在查核時只能找到第三方或社群來源，官方頁面需登入原廠支援入口，Skill 內文已標註「引用前重查」：
  - FortiNAC 9.4 EoS 與 FortiGate CNF End of Order 日期（Fortinet Product Life Cycle，需 FortiCare 帳號）
  - AirWave 軟體 EoS 與 2930F/2930M/5400R 停售狀態（HPE Networking Support Portal）
- 更新時效性內容時，同步更新對應段落的查核日期與 `bundle-manifest.json` 的 `version`。

## 維護規則

- 只在 `skills/` 內修改 Skill 正本；不要直接改安裝位置的複製版本。
- 保持五個 Skill 同層；`SKILL.md` 保持精簡且低於 500 行，細節放入一層深度的 `references/`。
- Frontmatter `name` 必須與資料夾名稱一致；`description` 不超過 200 字元（配合 Claude 說明中心的上傳限制），並同時寫出功能與觸發時機。
- 不憑記憶宣稱 CVE、fixed release、EoL、PQC、CLI、license 或 AI 平台功能；以原廠或官方文件為準並寫明查核日期。
- 不提交客戶設定、PCAP、帳號、密碼、PSK、私鑰、API token、license 或工單附件。
- 高風險建議必須包含證據、blast radius、停止條件、回滾與驗證。
