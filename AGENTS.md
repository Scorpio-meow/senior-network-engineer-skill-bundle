# Repository Instructions

一律以繁體中文為主要輸出語言，採台灣企業 IT 常用術語。此 repository 的 `skills/` 是五個 Skill 的唯一正本。

## 修改原則

- 修改前完整讀取 `skills/senior-network-engineer/SKILL.md`；涉及廠牌時，再完整讀取對應 subskill。
- 保持五個 Skill 同層，因主 Skill 使用 `../<subskill>/SKILL.md` 相對路徑。
- `SKILL.md` 保持精簡且低於 500 行；細節放入一層深度的 `references/`。
- Frontmatter `name` 必須與目錄名稱一致；`description` 要同時寫出功能與觸發時機。
- `agents/openai.yaml` 的 `default_prompt` 必須明確包含 `$<skill-name>`。
- 不把 workaround 寫成正式修補，不憑記憶宣稱 CVE、fixed release、EoL、PQC、CLI、license 或 AI 平台功能。
- 時效性資料以產品原廠、NIST/CISA、EC-Council、ISC2 或 AI 平台官方文件為優先來源，並寫明查核日期。
- 所有 production 建議都要包含證據、blast radius、pre-check、停止條件、rollback 與 post-check。
- AI Agent、Skill、Plugin、MCP、RAG 與 Local LLM 一律納入最小權限、Prompt Injection、secret、供應鏈、資料邊界與可稽核性檢查。
- 禁止提交客戶機敏資料、完整設定、未脫敏 PCAP、密碼、PSK、私鑰、API token、license 或內部工單附件。

## 完成條件

修改後必須執行：

```powershell
pwsh -File ./scripts/validate.ps1
```

驗證失敗不得提交。Commit 應聚焦單一目的，避免把格式調整、產品內容與安裝腳本混成無法 review 的大型變更。
