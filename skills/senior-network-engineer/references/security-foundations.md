# 資安基礎：CEH、CISSP 與網路工程實務

本 reference 將 CEH 與 CISSP 知識框架轉成資深網路工程師可執行的工作方法。它不是證照題庫，也不授權任何未經同意的攻擊行為。

官方基準查核日：2026-09-27。基準版本：CEH v13 與 CEH Exam Blueprint v5.0、ISC2 CISSP Exam Outline（2024-04-15 生效）、NIST SP 800-61r3。正式答覆仍應重新確認 EC-Council、ISC2、CISA/NIST 與產品原廠文件。

## 使用邊界

- 任何 reconnaissance、scanning、enumeration、exploitation、credential testing、wireless testing、social engineering 或 evasion 技術，只能在書面授權、明確 scope、時段、來源 IP、目標清單、停止條件與資料處理規範內使用。
- 預設將攻擊技術轉成防禦用途：辨識暴露面、驗證控制、建立偵測、確認修補、改善分段與產出證據。
- 不為了證明風險而破壞可用性、清除 log、維持未授權存取或接觸 scope 外資產。
- CEH 提供攻擊者視角與技術驗證；CISSP 提供治理、風險、架構、營運與生命週期視角。兩者缺一都容易得到偏斜答案。

## CEH v13（Exam Blueprint v5.0）防禦導向能力

EC-Council 目前為 CEH v13，Exam Blueprint v5.0 共 9 個領域；以下依序對應，各領域權重以官方 blueprint 為準。

### 1. Information Security and Ethical Hacking Overview

- 理解 CIA、Defense in Depth、Cyber Kill Chain、威脅、弱點、風險與控制類型。
- 先確認 Rules of Engagement、法規、契約、個資、證據保存與通報邊界。
- 將技術發現寫成資產、暴露面、攻擊 prerequisite、business impact、證據、修補與 residual risk。

### 2. Reconnaissance Techniques

- 從 DNS、WHOIS、憑證透明度、公開文件、路由資訊、SNMP/LDAP/NTP/SMB/IPv6/BGP 等面向盤點外洩資訊與可見服務。
- 防禦側檢查 split DNS、管理面暴露、banner、metadata、公開 topology、未必要的服務、ACL 與 logging。
- Network diagram 必須由 inventory、routing、MAC/ARP、CDP/LLDP 與實際封包交叉驗證，不能只相信過期 Visio。

### 3. System Hacking Phases and Attack Techniques

- 理解 vulnerability assessment、credential attack、privilege escalation、persistence、malware 與 lateral movement 的觀測點。
- 對應控制：MFA/PAM、管理網路隔離、AAA/TACACS+、RBAC、EDR/NDR、secure boot、弱點修補、application allowlisting、不可竄改 log。
- 發現可疑行為時保存時間線、來源、帳號、process、network flow、session、hash 與控制面事件，不先 reboot 或清除現場。

### 4. Network and Perimeter Hacking

- 理解 sniffing、MAC flooding、DHCP spoofing、ARP poisoning、DNS poisoning、session hijacking、DoS/DDoS 與 IDS/Firewall evasion。
- 對應控制：DHCP Snooping、DAI、IP Source Guard、port security、802.1X/NAC、segmentation、CoPP、uRPF、DNS security、TLS、DDoS scrubbing、NDR/IPS。
- NGFW 驗證不能只看 policy 名稱；必須核對 route、NAT、zone、session、application、user identity、decrypt、security profile、log 與回程。

### 5. Web Application Hacking

- 理解 Web server、authentication/authorization、session、injection、API、webhook 與 application logic 風險。
- 網路工程師重點是 Reverse Proxy/WAF/LB/NGFW 路徑、TLS termination、X-Forwarded-For、header trust、east-west policy、API 管理與 log correlation。
- WAF 或 IPS 命中不代表應用已修補；temporary mitigation 必須有 owner、expiry 與正式修補日期。

### 6. Wireless Network Hacking

- 理解 rogue AP、evil twin、deauthentication、弱加密、credential capture、Bluetooth 與無線側移動風險。
- 優先採 WPA3-Enterprise 或 WPA2-Enterprise/EAP-TLS、受控 supplicant、RADIUS 憑證驗證、WIDS/WIPS、rogue containment 治理與 RF/用戶端證據。
- 不用降低 EAP/憑證驗證當作永久解法；只可在隔離 lab 做短暫 A/B test。

### 7. Mobile Platform, IoT, and OT Hacking

- 建立 device identity、owner、firmware、protocol、通訊對象、可維護窗口、safety impact 與生命周期 inventory。
- 以 NAC、micro-segmentation、allowlist、jump host、passive discovery、vendor remote-access control 與 compensating control 降低風險。
- OT 先考慮安全與可用性；未經原廠/業主確認，不主動掃描脆弱 PLC、醫療或關鍵控制設備。

### 8. Cloud Computing

- 納入 shared responsibility、IAM、security group/NACL、cloud firewall、transit routing、private endpoint、container/serverless、key management、audit log 與 CSPM。
- Hybrid Cloud 問題同時驗證地端 route/NAT/IPsec/SD-WAN 與雲端 route table/security control，不把「雲端看得到」當作端到端可達。

### 9. Cryptography

- 理解對稱/非對稱加密、hash、digital signature、PKI、憑證生命週期、TLS/IPsec/SSH 與常見密碼學攻擊，例如弱演算法、協定降級、金鑰外洩與憑證誤用。
- 對應控制：停用弱 cipher/protocol、建立憑證與金鑰 inventory、HSM/金鑰保護、憑證到期監控、crypto agility 與 PQC migration。
- 以實際 handshake、cipher suite、憑證鏈與設備設定驗證，不以掃描報告的單一等級取代分析。

## CISSP 八大領域的工程落地

### 1. Security and Risk Management

- 建立 risk owner、asset owner、policy、exception、第三方風險、法遵、security awareness 與 ethics。
- 將風險寫成 `Asset + Threat + Vulnerability + Likelihood + Impact + Existing Control + Treatment + Residual Risk`。
- 技術上可行不代表企業應採用；必須評估業務持續、責任、成本、維運成熟度與稽核性。

### 2. Asset Security

- 分類設定檔、log、PCAP、網路拓樸、憑證、金鑰、帳號、模型、提示詞、向量資料庫與工單資料。
- 定義 owner、retention、encryption、masking、傳輸、備份、銷毀與跨境/第三方處理規範。

### 3. Security Architecture and Engineering

- 使用 threat modeling、trust boundary、secure defaults、fail secure、Defense in Depth、HA/DR 與 crypto agility。
- 將管理面、控制面、資料面、AI/MCP tool plane 與 OOB 分區；每一條跨區流量都有身分、policy、log 與 owner。
- PQC 依 cryptographic inventory、HNDL、資料壽命、hybrid migration 與原廠 support matrix 推進，不以產品行銷字眼取代互通測試。FIPS 203/204/205 已正式發布；FIPS 206（FN-DSA）與 HQC 標準在查核時尚未正式發布；NIST IR 8547 仍為草案，規劃 112-bit 強度的量子脆弱演算法（如 RSA-2048）2030 年後 deprecated、所有 RSA/ECC 2035 年後 disallowed。

### 4. Communication and Network Security

- 掌握 L1-L7、routing/switching、segmentation、VPN、WAN/SD-WAN、wireless、NAC、SASE、DDoS、DNS 與 network telemetry。
- Zero Trust 不是單一產品；要落到 identity、device posture、least privilege、continuous verification、micro-segmentation 與可觀測性。

### 5. Identity and Access Management

- 人員、服務帳號、設備、API、AI Agent 與 MCP server 都必須有可識別身分、最小權限、憑證生命週期與撤銷機制。
- 管理面採 MFA、PAM、AAA/TACACS+、RBAC、break-glass、JIT/JEA 與 command accounting；shared admin account 只能作為待改善風險。

### 6. Security Assessment and Testing

- 使用 configuration review、vulnerability scan、penetration test、tabletop、BAS、code/IaC scan、rule validation 與 restore/failover test。
- 測試需定義 scope、baseline、成功標準、evidence、false positive 處理、retest 與報告保存。
- AI 產生的測試或修補建議必須由人工、lab、設備 CLI/API 或官方 advisory 交叉驗證。

### 7. Security Operations

- 涵蓋 change/patch/vulnerability management、logging/SIEM/SOAR、incident response、BCP/DR、backup/restore、physical security 與 lessons learned。
- 事件應變以 NIST SP 800-61r3（2025-04，已取代 r2）為基準：以 CSF 2.0 的 Govern、Identify、Protect、Detect、Respond、Recover 組織事件應變的準備、偵測、處置與復原。若團隊沿用 Preparation、Detection/Analysis、Containment、Eradication、Recovery、Post-Incident 作為現場操作步驟，要註明這是實務模型而非現行 NIST 版本。服務恢復與 Root Cause 分開追蹤。

### 8. Software Development Security

- 網路自動化、Ansible/Terraform、API/MCP server、parser 與 AI 產生腳本都納入 SDLC/DevSecOps。
- 要有版本控制、code review、secret scanning、dependency/SBOM、SAST/DAST、測試、簽章、環境分離與部署核准。
- 不執行來源不明的 Skill、MCP server、套件或 AI 產生程式；先檢查來源、權限、安裝腳本、網路行為與供應鏈風險。

## CVE 與弱點治理整合

1. 建立可信資產 inventory：model、serial、OS/build、role、HA、feature、management exposure、EoL/EoS 與 owner。
2. 以原廠 advisory/PSIRT 為 primary source，補充 CISA KEV、NVD 與主管機關資訊；記錄查核日期與 advisory revision。
3. 判斷 vulnerable configuration、feature enablement、攻擊 prerequisite、active exploitation、暴露面、business impact 與 failure domain，不只看 CVSS。
4. 清楚區分 workaround、mitigation、virtual patch、hotfix/SMU、fixed release、正式升級與風險接受。
5. 檢查 upgrade path、相容性、HA/cluster/stack、license、容量、known issue、備份、OOB、停止條件與 rollback。
6. 採 lab/canary/staged rollout；變更前後保存版本、route、session、policy、HA、counter、log 與關鍵應用證據。
7. 更新弱點台帳：CVE/advisory、資產、證據、priority、owner、due date、處置、驗證、exception expiry 與 residual risk。

## 安全事件最低證據集

- 統一時區與 NTP 狀態、事件開始/發現/恢復時間。
- 五元組、VLAN/VRF/zone、正向與回程、NAT 前後位址。
- routing/FIB、ARP/ND、MAC、session、policy hit、AAA、HA、interface/queue counter。
- PCAP、log、alert、config diff、最近變更、受影響/未受影響樣本。
- 證據來源、蒐集人、時間、hash/保存位置、資料敏感度與 chain of custody（如適用）。

## 教育訓練建議

- L1：CIA、phishing、密碼/MFA、事件通報、基本 packet flow 與不可擅自變更。
- L2：CEH 防禦視角、弱點驗證、NGFW/NAC/WLAN、SIEM、PCAP、CVE 修補與標準 Runbook。
- L3/Architect：CISSP 風險與架構、threat modeling、Zero Trust、PQC、AI/MCP 安全、tabletop、RCA 與跨廠牌 incident leadership。
- 稽核/主管：risk register、exception、KPI/KRI、BCP/DR、供應鏈、AI governance 與 residual risk 簽核。
- Lab 必須使用授權環境，包含成功證據、故障注入、復原、清理與後測；不以「指令有跑」作為學習完成標準。
