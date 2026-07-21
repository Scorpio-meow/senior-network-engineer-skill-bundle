# 技術交付、文件與教育訓練

## 目錄

1. 文件共同規格
2. 架構與建置文件
3. 變更與維運文件
4. 事件與弱點文件
5. 教育訓練設計
6. 驗收與交接

## 1. 文件共同規格

先確認文件目的、讀者、範圍、產品與版本、環境、機密等級、格式、owner 與維護週期。沒有取得的資料標示 Assumption 或 TBD，不自行補出看似完整的設定。

所有正式文件至少包含：

- 文件編號、版本、日期、作者、審核者、核准者。
- 適用環境、產品、model、software/content/plugin 版本。
- 變更紀錄與資料來源查核日期。
- Scope、out of scope、assumption、dependency、constraint。
- 風險、HA/DR、可觀測性、權限邊界、備份與回滾。
- RACI、維護 owner、known issue、open item 與下一次 review 日期。

主管摘要、客戶版、技術版與 Runbook 可以有不同深度，但必須共用同一事實來源。避免同一架構在簡報、LLD 與 As-built 出現三種 IP 或版本。

## 2. 架構與建置文件

### HLD

HLD 回答「為什麼這樣設計」：

- Business/technical requirements 與成功標準。
- Logical/physical architecture、trust/failure domain。
- 正反向 traffic flow、north-south/east-west、Internet/WAN/cloud/DC/campus。
- HA/DR、RTO/RPO、convergence、degraded mode 與 single point of failure。
- Routing、segmentation、security policy、identity、management 與 logging strategy。
- Capacity、growth、license、support lifecycle、維運能力與 TCO。
- Migration approach、coexistence、rollback 與主要風險。

### LLD

LLD 回答「實際如何建置」：

- Device inventory、hostname、management/OOB、interface/port map。
- IP/VLAN/VRF/zone/VNI/SSID/role/addressing matrix。
- Routing protocol、neighbor、policy、filter、redistribution、metric/tag。
- LAG/MLAG/vPC/VSX/stack、STP/FHRP、HA/cluster parameters。
- Firewall/NAT/security profile、AAA/RADIUS/TACACS+、PKI/certificate。
- Management platform hierarchy、template/group/object、naming convention。
- SNMP/syslog/telemetry/NTP/DNS/backup、alert threshold 與 dashboard。
- Validation command、expected state、dependency 與 rollback mapping。

### As-built

As-built 只記錄實際上線狀態，不是將 LLD 改檔名。必須核對 running state、serial/license、software、interface、route/neighbor、HA、policy、管理平台、備份、監控、憑證、例外與未完成項目。

拓樸圖至少標示 device/role、介面、link speed、LAG、VLAN/VRF/zone、IP、routing boundary、HA、管理與 data flow。敏感版本另行管控，不在對外圖面暴露管理 IP、完整 public IP 或 credential。

## 3. 變更與維運文件

### MOP

MOP 至少包含：

1. 目的、scope、影響、maintenance window、change/ticket。
2. 角色與 bridge/contact tree。
3. Pre-check 與 baseline；每項附預期結果。
4. 備份、OOB、rollback image/config 與現場支援確認。
5. 逐步操作：設備、模式、指令/GUI path、執行人、預期結果。
6. 階段性驗證與 go/no-go decision point。
7. Stop condition：哪些告警、loss、鄰接或 HA 狀態出現就停止。
8. Rollback trigger、步驟、所需時間與驗證。
9. Post-check、監控期、客戶確認與文件更新。

不要把 MOP 寫成只有畫面截圖。操作者需要知道為什麼、預期看到什麼、錯了何時停。

### SOP

SOP 描述可重複日常操作：目的、頻率、權限、輸入、步驟、驗證、例外處理、escalation、紀錄位置與 owner。適合備份、帳號審查、憑證更新、弱點盤點、log review、HA health check、版本檢查與例行 failover drill。

### Runbook

Runbook 以症狀導向，提供 decision tree、第一批證據、低風險操作、停止條件、何時升級 L2/L3/TAC 與 handoff package。不要將所有問題的第一步都寫成 reboot。

### 維運基準

建立健康基準：

- Device/HA/cluster/stack/fabric state。
- Interface/optic/error/queue/CPU/memory/session/TCAM。
- Routing neighbor、route count、BFD、tunnel、SD-WAN SLA。
- DHCP/DNS/NTP/AAA/PKI、certificate expiry。
- Wireless client/RF/channel/retry/roaming。
- Log forwarding、backup、license、support/EoL 與 config drift。

## 4. 事件與弱點文件

### Incident Report／RCA

包含 executive summary、impact、timeline、detection、response、direct cause、contributing factor、evidence、containment、recovery、permanent fix、preventive action、owner/deadline 與 lessons learned。

區分：

- Trigger：啟動事件的動作或條件。
- Direct cause：直接造成服務失敗的技術機制。
- Contributing factor：擴大影響或延長修復的設計/流程問題。
- Root cause：能完整解釋條件、機制、時間與影響的根本原因。

### CVE 修補文件

使用矩陣記錄 advisory/CVE、資產、目前版本、feature exposure、Internet/management exposure、active exploitation/KEV、vendor mitigation、fixed release、target version、upgrade path、owner、deadline、evidence、rollback 與 residual risk。

### PQC 文件

建立 cryptographic inventory：protocol、algorithm、key/certificate、data retention、owner、vendor/platform/version、PQC readiness、dependency、priority。產出 Discover、Prioritize、Pilot、Migrate、Enforce、Operate roadmap，附 PoC 的 interop、MTU、performance、HA、fallback 與 rollback 結果。

### 驗證報告

每個 test case 包含目的、前置條件、步驟、expected、actual、timestamp、evidence、pass/fail、defect、owner 與 retest。只貼綠色勾勾但沒有證據，不能支撐驗收。

## 5. 教育訓練設計

### 對象分級

- 主管/稽核：架構、風險、營運指標、事件治理、合規與投資決策。
- Help Desk/NOC L1：症狀分類、第一批證據、Runbook、何時 escalation。
- 管理者 L2：設定、日常維運、備份、升級、HA、log、常見排障。
- 架構/排障 L3：packet flow、routing/session/ASIC、HA failure、CVE、PQC、packet capture 與 Root Cause。
- SOC/資安：policy、threat log、identity、CVE、incident correlation 與 containment。

### 課程結構

每門課定義：

- 可觀察的 learning objective，不只寫「了解」。
- 先備知識、產品/platform/release、設備與 license。
- 時間配置：觀念、demo、guided lab、independent lab、故障注入、測驗。
- Lab topology、initial state、success criteria、expected CLI/log/packet evidence。
- Safety、reset/cleanup、答案、常見錯誤與 instructor note。
- 前測、後測、實作評分、課後 FAQ 與改善回饋。

### 建議核心課綱

1. Packet journey：L2/L3、routing、session、NAT、policy、return path。
2. HA/stack/cluster/fabric 與 failure domain。
3. Monitoring、log、counter、packet capture 與時間關聯。
4. Incident triage、假設矩陣、Root Cause 與 evidence package。
5. Vendor-specific lab：依 Palo Alto/Fortinet/Cisco/Aruba subskill 規劃。
6. CVE assessment、upgrade MOP、rollback 與驗證。
7. PQC/HNDL/crypto inventory 與 interoperability PoC。
8. 客戶更新、TAC case、RMA、會議紀錄與 RCA 演練。

考核重點是能否安全取得正確證據、判讀結果與回復環境，不是背最多指令。

### 教材交付

交付課綱、簡報、講師手冊、學員手冊、Lab Guide、initial/final config、capture/log、答案、前後測、簽到、FAQ、錄影規則與適用版本聲明。Lab 中的 IP、帳密、token 與客戶資料必須使用測試值。

## 6. 驗收與交接

驗收應涵蓋正常、失效、降級與回滾：

- 基本 reachability、routing、application、AAA、DNS/DHCP/NTP。
- HA/failover、link/device/site failure、session/convergence。
- Policy/NAT/segmentation/security inspection/logging。
- Performance、MTU、latency/loss、capacity 與告警。
- Backup/restore、OOB、upgrade/downgrade 或 rollback。
- Monitoring、ticket/escalation、SOP/Runbook 與值班操作。

交接完成條件：文件已核准、設定與 As-built 一致、帳號與權限移交、備份可還原、監控有 owner、open item 有期限、維運人員通過實作、support portal/case/RMA 流程可用。

若系統已上線但維運團隊不知道如何判斷 HA 是否正常、如何回滾或怎麼向原廠開 case，這不是完成交付，只是把技術債換了負責人。
