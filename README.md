# Senior Network Engineer Skill Bundle

這是個人用的資深網路工程師 Skill 套件，將一個跨廠牌主 Skill 與四個產品 subskill 放在同一個 Git repository，供不同電腦共同使用與維護。

## 內容

- `senior-network-engineer`：跨廠牌架構、CEH/CISSP、CVE/PQC、AI Agent/MCP、進階排障、溝通、文件與訓練。
- `palo-alto-architect`：Palo Alto Networks、NGFW、Panorama、Prisma、Cortex、CVE 與 PQC。
- `fortinet-security-fabric-architect`：Fortinet Security Fabric、FortiGate、FortiManager、FortiAnalyzer、CVE 與 PQC。
- `cisco-network-dc-architect`：Cisco Campus/DC/ACI/SD-WAN/Wireless/ISE/FTD、CVE 與 PQC。
- `hpe-aruba-network-architect`：HPE Aruba WLAN/ClearPass/Central/AOS-CX、CVE 與 PQC。

主 Skill 透過相對路徑載入四個 subskill，因此五個目錄必須安裝在同一個 Skill root。

## 首次安裝

```powershell
git clone git@github.com:JoeChin0416/senior-network-engineer-skill-bundle.git
Set-Location senior-network-engineer-skill-bundle
pwsh -File ./scripts/validate.ps1
pwsh -File ./scripts/install.ps1 -Mode Link
```

若 Windows 只有內建 Windows PowerShell 5.1，可將 `pwsh` 改成 `powershell -NoProfile -ExecutionPolicy Bypass`；repository 內的腳本已使用相容的 UTF-8 編碼。

安裝腳本依序選擇 Skill root：

1. `$CODEX_HOME/skills`
2. 已存在的 `$HOME/.codex/skills`
3. 官方使用者範圍 `$HOME/.agents/skills`

也可明確指定：

```powershell
pwsh -File ./scripts/install.ps1 -Mode Link -SkillRoot "$HOME/.codex/skills"
```

`Link` 是建議模式：repository 內的修改會立即反映到 Codex Skill。若環境不允許 Junction/Symbolic Link，改用 `-Mode Copy`；Copy 模式更新後需重新執行安裝。

若目標已存在，腳本預設停止，不會覆寫。確認要接管既有安裝時，先預覽，再使用 `-Force`；既有目錄會移到 Skill root 同層的 `skill-backups`，不會直接刪除。

```powershell
pwsh -File ./scripts/install.ps1 -Mode Link -Force -WhatIf
pwsh -File ./scripts/install.ps1 -Mode Link -Force
```

不要同時把同名 Skill 安裝在 `.codex/skills` 與 `.agents/skills`，否則可能出現重複 Skill 或載入來源不明。

## 跨電腦更新

在有修改的電腦：

```powershell
pwsh -File ./scripts/validate.ps1
git status --short
git add -- <實際修改檔案>
git commit -m "更新資深網路工程師 Skill"
git push
```

在其他電腦：

```powershell
pwsh -File ./scripts/update.ps1
```

`update.ps1` 只接受 fast-forward，且本機有未提交修改時會停止，避免把不同電腦的內容直接覆蓋。若使用 Copy 模式，pull 後再執行：

```powershell
pwsh -File ./scripts/install.ps1 -Mode Copy -Force
```

## 使用方式

在 Codex 中明確呼叫主 Skill：

```text
$senior-network-engineer 請分析這個跨廠牌網路異常，先列證據與假設，再提供可回滾的 MOP。
```

也可直接呼叫單一廠牌 Skill，例如 `$palo-alto-architect` 或 `$cisco-network-dc-architect`。

## 維護規則

- 只在 `skills/` 內維護 Skill 正本；不要直接修改安裝目標的 Copy 版本。
- 產品版本、CVE、EoL、Recommended Release、PQC、AI Agent 與 MCP 能力必須查官方來源並標示日期。
- 不提交客戶設定、PCAP、帳號、密碼、PSK、私鑰、API token、license 或工單附件。
- 所有高風險建議都要有 evidence、blast radius、停止條件、rollback 與驗證。
- Push 前執行 `pwsh -File ./scripts/validate.ps1`；GitHub Actions 會再做一次相同檢查。

詳細維護規則見 [AGENTS.md](AGENTS.md)。
