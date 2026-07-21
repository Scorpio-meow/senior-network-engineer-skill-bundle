# 客戶、代理商與原廠溝通

## 目錄

1. 共通原則
2. 對象與需求差異
3. 會議與事件溝通
4. 原廠 TAC 與 Escalation
5. 代理商、授權與 RMA
6. 困難對話
7. 可重用範本

## 1. 共通原則

- 先理解對方要做的決策，再決定提供多少技術細節。
- 分開「已知事實、目前研判、待確認、已決策」。不要讓假設在轉寄三次後變成 Root Cause。
- 技術問題用可重現條件、時間戳、五元組、版本、log、counter 與 packet capture 說明。
- 對外說明影響、目前控制措施、下一步與風險；內部再保留完整假設與責任分析。
- 不責怪個人或廠牌。描述「哪個控制失效、哪個流程缺少驗證、哪個設計造成 blast radius」。
- 只承諾自己能控制的事項。原廠分析時間、物流、patch release 與第三方修復日期不能替別人保證。
- 所有會議結束前重述 decision、action、owner、deadline、blocker 與下一次更新時間。

## 2. 對象與需求差異

### 客戶技術團隊

需要知道：目前證據、影響範圍、風險、操作步驟、是否需要變更窗口、如何驗證與回滾。提供足以共同排障的細節，但先脫敏帳號、token、PSK、serial、完整 public IP 與個資。

交流技巧：

- 先用自己的話重述症狀，確認雙方處理的是同一問題。
- 問可回答的具體問題：「10:32 的失敗 client MAC/IP 是什麼？」優於「最近有沒有改東西？」
- 當客戶提出錯誤結論時，先承認觀察，再指出缺少的證據：「目前看到 Policy hit，但仍需確認 session 與回程，Policy Allow 不代表 server 已收到封包。」
- 提出最多三項下一步，標出優先序與每項能證明什麼。

### 客戶管理層

需要知道：營運影響、風險是否受控、服務狀態、決策需求、預計下一次更新。避免貼 CLI 與大量縮寫。Root Cause 未確認就明說，不能用技術字堆出虛假的確定感。

### 內部業務與 PM

需要知道：客戶承諾、scope、資源需求、阻塞點、商務或合約邊界、下一個 milestone。不要讓未經技術確認的銷售說法變成架構承諾。

### 代理商／經銷商

需要知道：產品、SKU、serial、support contract、license、版本、RMA/DOA 條件、物流、替代料、原廠 case number 與客戶時程。技術分析與商務流程分開追蹤，但使用同一 action log。

### 原廠 SE／TAC／PSIRT

需要的是可分析的 case package，而不是情緒。提供 impact、severity、topology、exact version、reproduction、timestamp、logs、tech-support、packet capture、已排除項目與明確問題。

## 3. 會議與事件溝通

### 會前

- 定義會議目的：資訊同步、技術決策、變更核准、原廠 escalation 或 RCA。
- 準備一頁事實：影響、timeline、topology、版本、證據、假設、已做動作、待決策。
- 指定主持人、技術 lead、紀錄者與對外發言窗口。多人同時對客戶給不同答案，通常比故障本身更難收斂。

### 會中

- 先講結論與當前狀態，再進技術細節。
- 將討論中的新資訊標記來源與時間，避免未驗證說法直接寫入結論。
- 遇到分歧時回到可觀測證據，定義一個能推翻其中一方假設的測試。
- 控制排障變更：誰執行、在哪台設備、何時、預期、停止條件、回滾。

### 會後

在短時間內發出紀錄：

- Confirmed facts
- Decisions
- Actions、owner、deadline
- Risks/blockers
- Next update/meeting
- Case/change/ticket references

### 事件更新節奏

更新頻率依 business impact 決定。即使沒有新 Root Cause，也要回報「哪些檢查已完成、哪些假設被排除、目前服務狀態、下一步與下一次更新時間」。不要用重複一句「原廠分析中」消耗信任。

## 4. 原廠 TAC 與 Escalation

### Case Package

至少包含：

1. 一句話 Problem Statement。
2. Business impact、受影響使用者/服務/站點與開始時間。
3. Severity 理由與是否有 workaround。
4. Topology 與正反向 packet path。
5. Product、model、serial、version/build、HA/cluster role、license/support。
6. Expected vs actual behavior。
7. Reproduction steps、頻率、成功/失敗比例與 last-known-good。
8. Recent changes 與已排除項目。
9. Timestamp、timezone、source/destination/protocol/port/user/client MAC。
10. Tech-support、log、counter、packet capture、crash/core 與檔案 checksum。
11. 已採 workaround、風險與可重現 lab 結果。
12. 明確要求：確認 defect、提供 bug ID、解讀 counter、建議 fixed release、review config 或安排 engineering escalation。

### Severity

Severity 必須對應真實 business impact、服務不可用程度、使用者範圍、資料或安全風險及 workaround，而不是用最高等級催進度。誇大 severity 會讓後續 escalation 失去可信度。

### Escalation 條件

- SLA 未達、無 owner、重複要求已提供資料、分析與證據矛盾、疑似安全事件、重大客戶/法遵影響、無 workaround 或 maintenance window 即將到期。
- Escalation 時附 case timeline、尚未回答的具體問題、期望資源與需要完成的時間，不只 CC 更多主管。

### 與原廠共同排障

- 要求每個 debug 說明目的、風險、filter、停止方式與預期輸出。
- 原廠建議升級時，要求對應 advisory/bug、affected/fixed release、open caveat、compatibility、upgrade path 與 rollback 限制。
- 原廠說「無異常」時，回到 packet/counter/time correlation，確認他們檢查了哪個元件與時間窗口。
- 保存檔案上傳時間、檔名、checksum 與 case note，避免不同版本的資料混用。

## 5. 代理商、授權與 RMA

RMA 前先確認 failure isolation、serial/PID、support entitlement、故障模組、diagnostic、LED/log、power/optic/cable swap、版本、HA 可用性與資料清除要求。不要把尚未排除的線路或設定問題直接包成硬體故障。

協調項目：

- RMA/DOA 類型、到貨 SLA、寄送地址、窗口、備品、相容版本、license transfer。
- replacement device 的 image、ROMMON/bootloader、module、power、optic、config restore 與加入 HA/stack/cluster 的程序。
- 故障設備歸還前的 config/credential/log/data wipe、證據保全與法遵要求。
- License、subscription、support contract、portal ownership 與 cloud tenant transfer。

代理商無法回答產品 defect 時，要求建立原廠 case；原廠無法處理合約/物流時，回到代理商。責任邊界說清楚，避免三方互踢。

## 6. 困難對話

### 必須否定客戶方案

使用結構：「我理解目標是 X；目前方案在 Y failure condition 會造成 Z；建議改為 A，因為能提供 B 證據與 C rollback。」

### 我方先前判斷錯誤

直接更正：「前一版研判與新取得的 packet capture 不一致。已確認原假設被推翻，目前證據指向……」說明影響與修正行動，不要用模糊文字掩蓋。

### 尚不知道原因

說明已知、已排除、下一個驗證與更新時間。「不知道」不可怕；沒有驗證計畫才是問題。

### 客戶要求立即變更

說明最短安全路徑：必要 pre-check、可接受的臨時措施、blast radius、停止條件與回滾。若沒有 OOB/備份/窗口，明確指出這是新增風險，而不是技術團隊動作慢。

### Scope 或合約外

先協助界定 fault domain 與緊急風險，再清楚說明哪部分需要額外授權、原廠或其他團隊。不要用 scope 當成拒絕共同定位問題的第一句。

## 7. 可重用範本

### 客戶事件更新

```text
主旨：［系統/服務］事件進度更新（YYYY/MM/DD HH:mm）

目前狀態：
影響範圍：
已完成檢查：
目前研判／待確認：
暫時措施與風險：
下一步與負責窗口：
下次更新時間：
```

### 資料請求

```text
為了確認故障點，請協助提供：
1. 問題發生時間與時區
2. 來源/目的 IP、port、使用者或 client MAC
3. 成功與失敗案例各一筆
4. 最近一次正常時間與近期變更

這些資料分別用來關聯 log/session/packet capture，取得後我們會先確認封包在哪一段中斷。
```

### TAC Escalation 摘要

```text
Business impact:
Environment and exact versions:
Expected vs actual:
Reproduction and frequency:
Timestamp/timezone and traffic tuple:
Evidence attached:
Workaround and risk:
Questions requiring engineering response:
Required next action/time:
```

### 事件結案

```text
事件影響與時間線：
直接原因與促成因素：
修復與驗證證據：
殘餘風險：
預防措施、owner、期限：
文件/監控/SOP 更新：
```
