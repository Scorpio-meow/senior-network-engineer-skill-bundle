# 進階網路排障方法

## 目錄

1. 事故資料契約
2. 故障域分層
3. 假設與證據矩陣
4. 封包擷取與時間關聯
5. 間歇性與效能問題
6. 常見高階失敗模式
7. Root Cause 與結案標準

## 1. 事故資料契約

開始排障前，至少取得以下資料；缺少的欄位標示待確認，不要自行補完。

- 症狀：誰從哪裡連到哪裡、使用什麼 protocol/port/application、看到什麼錯誤。
- 範圍：單一使用者、VLAN、site、SSID、應用、設備、線路或全域。
- 時間：首次發生、最後正常、持續或間歇、頻率、時區、監控與 log 是否同步 NTP。
- 變更：網路、資安政策、憑證、DNS/DHCP、伺服器、ISP、軟體版本或機房作業。
- 拓樸：正向與回程、NAT、VRF/zone/VLAN、HA、load balancer、overlay、tunnel、cloud path。
- 資產：model、版本/build、uptime、license、HA/cluster role、管理平台及支援狀態。
- Baseline：正常延遲、loss、throughput、session、CPU/memory、interface/queue counters 與既有告警。

先將症狀改寫成可驗證敘述，例如：「10:15–10:18，來源 A 經 Firewall-B 對 Server-C:443 的 TCP SYN 有去無回；同 VLAN 其他來源正常。」這比「網路很慢」有用得多。

## 2. 故障域分層

### L1：實體與光層

檢查 link state、speed/duplex、光功率、DOM、CRC/FCS、input/output error、carrier transition、FEC、PoE、cabling、transceiver 相容性與 interface flap。兩端 counter 必須同時看；單端 clean 不代表鏈路正常。

注意 micro-bend、單纖問題、光功率邊界、第三方模組告警、auto-negotiation mismatch 與只有特定速率才發生的 bit error。先保存 counter delta，再考慮清除 counter。

### L2：交換與廣播域

檢查 access/trunk/native VLAN、allowed VLAN、STP role/state/topology change、LACP member、MLAG/vPC/VSX/stack consistency、MAC learning/move/flap、storm-control、loop protection、port-security、802.1X/MAB 與 broadcast/multicast 行為。

同一 MAC 在短時間跨 port 移動，可能是 loop、teaming、wireless roaming、HA 虛擬 MAC 或錯誤 bridge；先核對情境，不要看到 MAC flap 就直接 shutdown port。

### L3：鄰接、路由與轉送

同時查 RIB 與 FIB、ARP/ND、recursive next hop、VRF、ECMP、PBR、uRPF、route leaking、summary/default route、administrative distance、metric、BFD、redistribution tag 與 route withdrawal timing。

一定要驗證回程。Forward path 正確但 return path 經另一台 stateful device，是最常見的「Policy 都 Allow 但連線仍失敗」。使用 source-specific ping/traceroute，必要時指定 VRF、source interface、DF bit 與 packet size。

### L4：Session、NAT 與傳輸

檢查五元組、TCP state、SYN/SYN-ACK/ACK、retransmission、RST 來源、window、MSS、PMTUD、fragmentation、idle timeout、session aging、NAT pool/port exhaustion、ALG、load balancer persistence 與 state synchronization。

UDP 沒有 handshake，不代表沒有 state。DNS、RADIUS、SIP、IPsec、QUIC 等應同時看 request/response、transaction ID、timeout 與中間設備 session。

### L5–L7：服務與身分

檢查 DNS answer/TTL/split-horizon、DHCP DORA/relay/option、NTP、RADIUS/TACACS+、LDAP/AD、TLS handshake、certificate chain/SAN/EKU/expiry/CRL/OCSP、SNI、HTTP status、proxy、API dependency 與應用 health。

「Ping 通」只證明某個 ICMP path 在某個時間成立，不代表 DNS、TCP、TLS、authentication 或應用正常。

### Control Plane 與 Data Plane

Control plane 鄰接正常不代表 ASIC/FIB 已正確 programming；反之，既有 data-plane session 仍通也不代表 control plane 健康。比對 route、adjacency、hardware forwarding、TCAM/resource、drop counter 與實際封包。

### Overlay、Tunnel 與 HA

對 IPsec/GRE/VXLAN/SD-WAN/SASE 檢查 underlay reachability、overlay adjacency、selector/VNI/TLOC、MTU、encapsulation overhead、rekey、path monitoring 與 asymmetric return。

對 HA/cluster 檢查 role、split brain、state/session sync、link/path monitor、virtual MAC/IP、gratuitous ARP/ND、routing adjacency、preempt/override 與 failover 後 upstream convergence。不要只確認 peer 顯示 up。

### Wireless 與 AAA

依 association、authentication、role/VLAN、DHCP、DNS、gateway、policy、RF/roaming 順序排查。RF 至少看 RSSI、SNR、noise、retry、channel utilization、airtime、MCS、band/channel width、DFS 與 client capability。

RADIUS Reject 通常是 policy/identity/certificate；Timeout 通常是 path、shared secret、NAD、firewall、service 或 upstream dependency。先看完整 Access/Live Log，不要直接改成 allow-all。

## 3. 假設與證據矩陣

每次只保留最多三個高機率假設，使用下列欄位：

| 假設 | 支持證據 | 預期看到 | 可推翻證據 | 下一步 | 風險 |
|---|---|---|---|---|---|
| 回程非對稱 | SYN 有去無回 | 回程 route 指向另一台防火牆 | Server 端未收到 SYN | 同時抓兩端與兩台防火牆 | 低 |

驗證要能改變判斷。若結果無論如何都被解讀成支持原假設，那不是驗證，只是替直覺找理由。

避免：

- 同時修改 route、policy、NAT 與 MTU，最後無法知道哪項有效。
- 一開始就 reboot、clear session、clear route 或 failover，破壞瞬間狀態。
- 只收集大量 `show tech`，卻沒有事件時間戳、五元組與問題重現點。
- 將單次成功測試當成間歇性問題已修復。

## 4. 封包擷取與時間關聯

### 擷取設計

先定義問題封包的五元組、方向、VLAN/VRF/zone、pre/post NAT、預期 ingress/egress 與事件時間。優先在故障域邊界同時擷取，而不是只在端點抓一份。

擷取點可包括：來源端、access/core、firewall ingress/egress、load balancer、server、tunnel underlay/overlay。每個擷取點要回答「封包有沒有到、欄位是否改變、何時消失」。

### 關聯方法

- 確認設備 NTP 與 timezone；記錄事件的絕對時間與時區。
- 使用 IP/port、TCP sequence/ack、IP ID、TTL、ICMP quoted packet、DNS transaction ID 或 TLS ClientHello 關聯同一流量。
- 比對 SYN 到 SYN-ACK、retransmission interval、RST/ICMP 產生位置與 NAT 前後 tuple。
- 注意 NIC checksum offload 可能讓端點 capture 顯示假 checksum error。
- 注意 SPAN oversubscription、ASIC offload、sampling 與 capture drop；「沒抓到」也可能是擷取方法失敗。

### 安全與隱私

限制 BPF/filter、snap length、packet count、duration 與 ring buffer。擷取可能含帳號、cookie、token、憑證或個資；交付前脫敏，使用受控管道保存並設定刪除期限。

## 5. 間歇性與效能問題

間歇性問題要建立時間序列，不要靠單張截圖：

- 同步收集 latency、loss、jitter、interface/queue drop、CPU/memory、session、route/BFD/HA event、RF、應用 transaction 與外部 dependency。
- 比較正常與異常窗口，保留同一套查詢、相同時間粒度與相同時區。
- 找 trigger：流量高峰、備份、routing convergence、rekey、certificate check、DHCP renewal、AP roam、GC、log rotation、HA sync 或 cloud/ISP event。
- 對 throughput 問題分辨 access speed、single-flow limit、TCP window/RTT、packet loss、policer/shaper、queue/buffer、CPU path、crypto/inspection、MTU 與 server limit。
- Microburst 可能不反映在五分鐘平均流量；查看 queue drop、buffer telemetry 與更細粒度資料。
- 壓力測試前取得授權，限制流量、時間與目的端。`iperf` 跑滿線路不是診斷的第一步。

## 6. 常見高階失敗模式

- 非對稱路由：一側建立 session，回程走另一側而被丟棄。
- PMTUD black hole：小封包正常，大封包或 TLS/SMB 卡住；ICMP fragmentation-needed 被擋。
- MTU 疊加：VXLAN/IPsec/SD-WAN/PPPoE 多層封裝造成 fragmentation 或 drop。
- NAT/policy tuple 認知錯誤：比對 pre/post NAT address 或 zone 的規則寫反。
- Control/Data-plane divergence：RIB/adjacency 正常，但 FIB/ASIC/TCAM programming 異常。
- Hardware offload blind spot：CPU capture/debug 看不到已 offload 流量，或只有 exception packet 被送 CPU。
- Session stickiness：路徑或 policy 已改，但既有 session 仍沿舊狀態；清 session 前先保存證據並評估影響。
- HA 部分失效：peer up，但 session sync、routing、license、content、link monitor 或 upstream convergence 不完整。
- Route redistribution loop：缺少 tag/filter，路由在 OSPF/BGP/OMP/overlay 間重新注入。
- ECMP hashing：只有部分 flow 失敗，單一 ping/traceroute 無法重現問題 path。
- DNS split-brain/negative cache：不同 resolver、view、TTL 或 stale record 造成「有些人正常」。
- NTP/certificate：時間飄移導致 EAP-TLS、API、VPN 或管理登入間歇失敗。
- Buffer/queue/policer：interface utilization 不高，但特定 class 或 egress queue 丟包。
- MAC/ARP stale 或移動：HA、virtualization、roaming、teaming 或 loop 引發黑洞。
- Middlebox re-encryption/inspection：TLS version、SNI、mTLS、certificate pinning、QUIC 或 PQC negotiation 被改變。
- Cloud dependency：路由與防火牆正常，但 IdP、DNS、SaaS、certificate service 或 API rate limit 異常。

## 7. Root Cause 與結案標準

Root Cause 必須回答：哪個元件、什麼條件、透過何種機制、為何在該時間造成該影響。只有「設備異常」、「網路不穩」或「重開後正常」不算 Root Cause。

結案至少包含：

- Incident timeline 與影響範圍。
- 直接原因、促成因素與未證實假設。
- 證據：log/counter/packet/config/version/timestamp。
- Containment、恢復動作、permanent fix 與 preventive action。
- 驗證期間、監控指標、owner 與 deadline。
- 文件、告警、SOP、架構或教育訓練的改善項目。

如果服務恢復但證據不足，狀態應為「恢復、觀察中、Root Cause 未確認」，不要為了關單而製造一個看似完整的故事。
