# AI Agent 輔助資深網路工程

本 reference 用於選擇與治理 Codex、Claude Code、Cursor、Gemini、LM Studio、Hermes Agent、Skills、MCP、RAG 與相關 AI 工具。官方基準查核日：2026-07-21。產品能力變動快速，涉及版本、費用、資料政策、模型、CLI、授權或企業功能時必須重查官方文件。

使用者提到的 `harmes agent` 預設解讀為 Nous Research 的 `Hermes Agent`；若情境指向其他產品，先確認名稱。

## 核心立場

- AI 是證據整理、假設生成、重複作業與文件產出的放大器，不是 production 變更授權人。
- Agent 能使用工具，不代表它理解設備現況；沒有 routing/session/counter/log/PCAP 或 API 回傳的結論仍是推論。
- 自動化的風險取決於 `模型能力 x 資料敏感度 x 工具權限 x 網路出口 x 執行自主性 x blast radius`。
- 所有工具遵循 read-only first、least privilege、human approval、environment separation、audit trail、rollback 與 post-change verification。

## 平台能力定位

### OpenAI Codex

- 適合 repository/workspace 內的多步驟工程、檔案修改、shell、測試、review、Skills、MCP、AGENTS.md 與 subagent 工作流。
- 使用 `AGENTS.md` 保存 repository 長期規則，Skill 保存可重用程序，MCP 連接外部工具/資料；repo-specific 與 user-wide instruction 要分層。
- 依 sandbox、approval policy、network access 與 MCP tool scope 控制權限。即使 web/cache 或 project 被標記 trusted，外部內容仍視為不受信任。
- 網路用途：解析設定與 log、生成 Netmiko/Nornir/Ansible/Terraform、建立 MOP/Runbook、比對 config diff、驗證測試與維護 Skill repository。

### Anthropic Claude Code

- 適合 CLI/repository 內的 agentic coding、檔案與 terminal 工作、MCP、Skills、hooks、subagents/Agent SDK 與非互動自動化。
- 以 `CLAUDE.md`/project instruction、permission mode、allow/deny tool、hooks 與 MCP scope 控制行為；危險的 skip-permission 模式不可作為企業預設。
- 網路用途：多檔設定重構、API/automation、log/tech-support 摘要、文件與 code review；外部輸出仍需設備/官方文件驗證。

### Cursor

- 適合 IDE 內互動開發、Agent、terminal、Rules/AGENTS.md、checkpoint、MCP 與 codebase context。
- Project Rules 位於 `.cursor/rules`，MCP 可放 project 或 user scope；MCP tool 預設核准機制與 Auto-run 必須依環境風險設定。
- 網路用途：開發 parser、dashboard、IaC、自動化模組、單元測試與文件；不要讓 IDE Agent 直接持有 unrestricted production credential。

### Google Gemini CLI / Gemini Code Assist

- 適合 CLI/IDE 工程、檔案與 shell tools、GEMINI.md、extensions、MCP、custom commands、memory 與 Google Cloud/Code Assist 工作流。
- Extensions 可封裝 prompts、MCP servers 與 commands；應利用 excludeTools、workspace policy、approval mode、sandbox/container 與 corporate proxy 限制能力。
- 網路用途：GCP/hybrid automation、設定分析、批次文件、測試與跨檔案工程；sandbox 降低風險但不消除惡意 MCP/套件與資料外洩。

### LM Studio

- 適合在地模型推論、敏感資料 PoC、離線/受控環境、OpenAI/Anthropic-compatible API、native REST API、RAG、tool calling 與 MCP。
- Local 不等於安全：仍要治理模型/量化檔來源、模型授權、prompt/template、MCP、API token、listen address、LAN exposure、log、GPU/記憶體與資料保存。
- 網路用途：脫敏後的設定/log 摘要、在地知識庫、文件分類與實驗；複雜 CLI/弱點判斷要評估模型能力與 context limit，不能因資料留在地端就降低驗證標準。

### Nous Research Hermes Agent

- 適合 model-agnostic agent、CLI/desktop/messaging gateway、memory、Skills、自我學習、MCP、plugins、scheduled automation、subagents 與遠端執行環境。
- 自我建立/改善 Skill 與長期 memory 會增加持久化風險；任何自動學習內容都要有來源、review、版本控制、可撤回與敏感資料清理。
- Messaging、gateway、webhook、remote terminal、MCP 與 plugins 需各自做 identity、pairing、scope、secret、egress、audit 與 rate-limit 管理。
- 網路用途：輪值摘要、排程健康檢查、知識累積、多平台通知與 agent orchestration；production automation 必須設 approval gate 與失敗停止條件。

## 如何選擇

- Repository/腳本/Skill 長期維護：優先 Codex、Claude Code 或 Cursor，依團隊 IDE/CLI 與治理能力選擇。
- Google Cloud/Google 生態與 CLI extension：評估 Gemini CLI/Code Assist。
- 資料不可離開地端或需測試開源模型：評估 LM Studio；先確認算力、模型品質、license 與 API 暴露。
- 跨訊息平台、長期 memory、自我學習與排程 Agent：評估 Hermes Agent；提高持久化、外掛與遠端執行控制。
- 同一工作流需跨工具：把 vendor-neutral 流程放在 Skill/AGENTS.md，外部能力放 MCP，credential 留在受控 secret store，不複製進提示詞或 Git。
- 不以 benchmark 或單次 demo 決策；用自己的設定檔、PCAP、文件、腳本與故障案例做 acceptance test。

## Skills、Rules、Instructions、Memory 與 RAG

- `Skill`：可重用程序與領域知識，應有明確 trigger、步驟、護欄、references、驗證與版本控制。
- `AGENTS.md`/`CLAUDE.md`/`GEMINI.md`/Cursor Rules：repository 或工具的長期操作規則；保持精簡、可執行、有優先順序。
- `Memory`：跨 session 的偏好或經驗；不得默認保存 secret、客戶資料、未證實 Root Cause 或已過時版本結論。
- `RAG`：將受控文件檢索進上下文；需要來源、版本、ACL、chunking、metadata、刪除同步、citation 與 retrieval evaluation。
- `Prompt template`：不能取代權限控制。提示詞寫「不得修改 production」不等於 tool credential 沒有寫入權限。
- Community Skill/Rule/Prompt 皆視同可執行供應鏈輸入；安裝前做來源、內容、script、dependency、permission、network 與 secret scan。

## MCP 架構與治理

MCP 由 Host、Client、Server 組成，Server 可暴露 Tools、Resources 與 Prompts。Skill 定義工作流，MCP 提供外部能力；兩者不是同一層。

### 上線前檢查

1. 建立 MCP registry：owner、來源、版本、transport、endpoint、tools/resources/prompts、資料分類、相依 API、auth、scope、egress、更新與停用方式。
2. 區分 read-only 與 write/destructive tools；預設停用不需要的 tool，避免把整個 API surface 暴露給 Agent。
3. HTTP MCP 採 OAuth 2.1/HTTPS、正確 audience/resource binding、最小 scope、短效 token、PKCE 與精確 redirect URI；禁止 token passthrough。
4. STDIO MCP 以受限 OS account/container 執行，固定 package/version/hash，限制 cwd、filesystem、environment variables、subprocess 與 network。
5. Secret 由 secret manager 或受控環境變數注入；不得放進 repository、Skill、prompt、MCP 回傳、debug log 或聊天紀錄。
6. 驗證 tool schema、input、output、timeout、size limit、rate limit、idempotency、retry 與錯誤處理；避免 Agent 因模糊 tool description 呼叫錯誤動作。
7. 記錄 user/agent、tool、arguments（脫敏）、target、result、approval、timestamp、correlation ID 與 failure；高風險行為送 SIEM/告警。
8. 防範 prompt injection、tool poisoning、confused deputy、OAuth redirect/token theft、DNS rebinding、SSRF、local server compromise 與供應鏈攻擊。
9. Dev/Test/Prod MCP、credential、data store 與 network route 分離；禁止開發 Agent 自動沿用 production 權限。
10. 定期 recertification：owner 確認、unused tool 移除、token rotation、版本/CVE、dependency、權限與 disaster recovery。

## AI 輔助網路工程標準流程

```text
Plan -> Collect -> Normalize -> Analyze -> Validate
     -> Propose -> Approve -> Execute -> Verify -> Record/Rollback
```

### Plan

- 定義目標、資產、廠牌/版本、資料敏感度、允許工具、禁止事項、完成條件與時限。
- 決定 AI 只分析、可產生草稿、可改 repository，或可透過受控 API 執行；權限不得靠模糊語意推定。

### Collect

- 優先使用 read-only show/API、inventory、config backup、log、counter、session、route、PCAP、advisory 與 topology。
- 蒐集前脫敏 public IP（視需要）、客戶名稱、帳號、PSK、token、私鑰、憑證 private material、email、內網機敏位址與 payload。

### Normalize

- 將時間統一為含 timezone 的 ISO 8601；保留原始 log。
- 將不同廠牌資料轉成共同欄位：device、interface、VRF/zone、src/dst/port/protocol、route、NAT、policy、session、action、timestamp。
- 大型輸出切片時保留 header、command、device、時間與行號；避免失去上下文後讓模型錯誤關聯。

### Analyze

- 要求 AI 分開 `Fact / Inference / Unknown / Next Validation`。
- 限制前三個假設，為每個假設提供支持證據、反證與最低風險驗證。
- CVE、CLI、支援矩陣、license、EoL、Recommended Release 與 PQC 一律查官方、exact model/release 與日期。

### Validate

- 設定/指令：parser、vendor syntax check、lab、read-only query、dry-run、diff 或第二位工程師 review。
- 排障：設備輸出、雙端 PCAP、session/routing/MAC/ARP/counter、監控與未受影響樣本交叉驗證。
- 文件：source link、版本、日期、reviewer、假設與未決項目。

### Propose and Approve

- 產出 MOP：目的、scope、pre-check、逐步命令、預期結果、停止條件、rollback、驗證、owner 與溝通節點。
- Approval 要能看到實際 diff/command/target，不接受只有「允許 Agent 執行」的泛化授權。

### Execute

- 採 lab、canary、單站/standby、分波次；每一步確認結果再繼續。
- Agent 必須在 timeout、unexpected output、HA degradation、loss/latency threshold、management disconnect 或 scope drift 時停止。

### Verify and Record/Rollback

- 驗證 data/control/management plane、HA、routing、session、policy、telemetry、關鍵應用與回程。
- 保存原始證據、AI prompt/重要輸出、model/tool/version、approval、diff、執行人、結果與 residual risk。
- 達停止條件立即 rollback；回滾後仍要驗證，不把「命令成功」當成服務恢復。

## 典型應用

### 設定與 Inventory

- 解析多廠牌 config、建立 interface/VLAN/VRF/zone/IP/policy/NAT/routing matrix。
- 比對 intended vs running vs startup/central manager 狀態，找 drift、shadow rule、any-any、unused object、弱加密與管理面暴露。
- 產出變更 diff，但原始設定與 secret 必須留在核准的資料邊界。

### 排障與封包分析

- 將 log/counter/PCAP timestamp 對齊，建立 packet walk 與故障域矩陣。
- 由五元組、TCP flags、retransmission、RTT、MTU/fragmentation、TLS、DNS 與 application error 產生假設。
- AI 不得只依單側 PCAP 宣告對端問題；先確認 capture point、offload、SPAN loss、time skew 與 asymmetric path。

### CVE、PQC 與安全治理

- 將 inventory 對應原廠 advisory、vulnerable configuration、fixed release、KEV、mitigation、maintenance window 與 evidence。
- 用 AI 協助建立 crypto inventory、HNDL priority、vendor support matrix 與 PoC plan；任何支援宣稱需官方查核。
- 禁止讓 Agent 自動下載/安裝不明 firmware、hotfix、MCP server 或 package 到 production 管理站。

### 自動化與 IaC

- 生成 Netmiko/NAPALM/Nornir/Ansible/Terraform/API 程式時，要求 idempotency、input schema、credential handling、concurrency limit、retry、logging、dry-run、checkpoint 與 rollback。
- 測試 malformed input、partial failure、timeout、HA switchover、device unavailable、rate limit 與版本差異。
- Production credential 使用短效/JIT、vault、RBAC 與 command accounting；不要寫在 inventory、`.env` 範例或 prompt。

### 文件、信件與教育訓練

- AI 可先草擬 HLD/LLD/As-built/MOP/SOP/RCA/弱點台帳/教材，再由 owner 以實際設備與版本審核。
- 對客戶、代理商、原廠的版本必須共用同一事實基線；不得由模型自行補 ETA、Root Cause 或原廠承諾。
- 教材加入 Prompt Injection、AI hallucination、MCP 權限、secret handling、lab validation 與 AI-assisted troubleshooting 實作。

## 防幻覺與品質門檻

- 要求輸出附 evidence pointer：檔名/行號、command/timestamp、packet number、API response 或官方 URL。
- 任何不存在於輸入或官方來源的 model、version、CLI、CVE、bug ID、license、feature 預設標記 `待查證`。
- 使用小型固定案例做 regression evaluation：routing loop、asymmetric firewall、MTU、802.1X Reject/Timeout、HA split-brain、CVE false match、惡意 log prompt injection。
- 衡量 precision、false positive、修正次數、工程師節省時間、事故 MTTR、變更成功率與 rollback rate，不以文字流暢度評估 Agent。

## 最低安全基線

- Cloud Agent：企業帳號、MFA/SSO、核准資料分類、retention/telemetry、DLP、project/repo allowlist、restricted egress。
- Local Agent/LLM：host hardening、磁碟加密、模型來源/hash/license、API 綁 localhost、token、firewall、process isolation、patch 與 log。
- MCP/Plugin/Skill：可信來源、版本鎖定、code review、permission manifest、secret scan、CVE/供應鏈檢查、停用與回復程序。
- Production：read-only service account、jump host/OOB、PAM/JIT、change ticket、human approval、canary、command accounting、SIEM 與 emergency stop。
- 資料：最小化、脫敏、目的限制、retention、刪除、備份、跨境/第三方審查與 incident response。
