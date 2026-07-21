# Field Playbooks

Use this reference for common customer-facing Fortinet scenarios.

## FortiGate vs Palo Alto

Recommend based on the customer's actual pain:

- Fortinet strengths: lower overall TCO in many deployments, broad Security Fabric integration, native Secure SD-WAN, strong branch deployment economics, and dense Taiwan SI support.
- Palo Alto strengths: very strong application identification and mature high-end enterprise firewall posture.
- Decision framing: if the customer mainly needs branch SD-WAN, cost-efficient NGFW, centralized management, and Fabric integration, Fortinet is usually the pragmatic choice. If the customer is optimizing for highly granular application control in a premium firewall-first architecture, Palo Alto deserves a serious look.

Never attack the competitor. A credible answer admits tradeoffs.

## "FortiGate 常常出問題"

Do not defend the product first. Ask for:

- Exact model and FortiOS build.
- HA mode and failover history.
- Whether the issue is traffic drop, GUI slowness, SSL VPN, SD-WAN steering, conserve mode, routing, or UTM inspection.
- Whether the device is on a feature release, mature release, or special build.

First checks:

```text
get system status
get system performance status
diagnose sys top
diagnose hardware sysinfo memory
diagnose sys session stat
get log eventfilter
```

Common causes: wrong firmware train for production, HA heartbeat/session pickup problems, SD-WAN SLA probes too aggressive or pointed at bad targets, over-enabled SSL inspection, undersized model, log/storage pressure, or policy/NAT order mistakes.

## Need FortiManager?

If more than 5 FortiGate devices exist, recommend FortiManager. Ask:

- How many FortiGate devices?
- How many admins?
- How often are policies changed?
- Are objects consistent across sites?
- Is there an approval process?

Practical line: "你現在有幾台？每次要改 Policy 要登幾個管理介面？這個答案通常就決定要不要上 FortiManager。"

## FortiAnalyzer vs FortiSIEM

One-line answer: FortiAnalyzer is deep Fortinet log analytics; FortiSIEM is multi-vendor SIEM correlation.

If the estate is mostly Fortinet, start with FortiAnalyzer. If the SOC must correlate firewall, endpoint, Windows, Linux, AD, cloud, switch, WAF, EDR, and identity events across vendors, evaluate FortiSIEM.

Budget-limited order: FortiAnalyzer first for Fortinet visibility, then SIEM/SOAR when incident workflow and cross-vendor correlation become real requirements.

## SD-WAN Design

Ask before designing:

- Number of branches and expected growth.
- MPLS, Internet, LTE/5G, or mixed transport.
- Hub locations and datacenter/cloud topology.
- SaaS traffic: Microsoft 365, Salesforce, Zoom, Teams, ERP.
- Required failover time and application tolerance.
- Whether ADVPN is needed.
- Centralized management requirement.

Avoid defaulting to full mesh. Full mesh becomes operationally expensive. For many enterprises, Hub-and-Spoke with selective ADVPN or partial mesh is easier to operate.

## ZTNA vs SSL VPN

Do not recommend immediate full replacement unless there is a security mandate or SSL VPN is structurally unfit.

Recommended migration path:

1. Keep current SSL VPN for stable employee workflows.
2. Introduce ZTNA for new applications, contractors, unmanaged or non-domain devices, and app-specific access.
3. Use FortiClient EMS posture and ZTNA tags.
4. Track adoption, failed access, helpdesk cases, and rollback paths.

## FortiEDR vs Microsoft Defender

Defender is a baseline endpoint control. FortiEDR is stronger when behavior detection, automated isolation, and Security Fabric response matter.

Emphasize the integration: endpoint incident can drive FortiGate blocking, Fabric telemetry, and incident workflows. If the customer only needs basic anti-malware and already pays for Microsoft licensing, Defender may be enough. If lateral movement, ransomware containment, and Fortinet Fabric response are priorities, FortiEDR has a clearer role.

## Troubleshooting Template

For any traffic issue, build the path:

1. Source endpoint: IP, gateway, DNS, route, local firewall.
2. Access layer: VLAN, MAC table, port state, 802.1X/NAC.
3. FortiGate ingress: interface, route lookup, policy match, NAT, session.
4. Security inspection: IPS, App Control, Web Filter, SSL inspection, DNS Filter.
5. FortiGate egress: route, SD-WAN rule, SLA state, NAT.
6. Return path: asymmetric routing, upstream firewall, server route.

Minimum FortiGate evidence:

```text
get router info routing-table all
diagnose firewall proute list
diagnose firewall iprope lookup <src-ip> <src-port> <dst-ip> <dst-port> <protocol> <incoming-interface>
diagnose sys session filter clear
diagnose sys session filter src <src-ip>
diagnose sys session filter dst <dst-ip>
diagnose sys session list
diagnose debug flow filter clear
diagnose debug flow filter addr <src-or-dst-ip>
diagnose debug flow show function-name enable
diagnose debug enable
diagnose debug flow trace start 100
diagnose debug disable
diagnose sniffer packet any 'host <src-ip> and host <dst-ip>' 4 0 a
```

Interpretation rule: every troubleshooting answer should say what result confirms or rejects the hypothesis.
