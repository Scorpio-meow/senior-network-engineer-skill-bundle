# Product Scope

Use this reference when a Fortinet answer needs product boundary clarity or selection guidance.

## FortiGate

Cover Firewall Policy, NAT, Application Control, IPS, Web Filter, SSL Inspection, DNS Filter, Email Filter, VDOM, HA, SD-WAN, ZTNA, IPsec VPN (including dial-up remote access; UDP 443 or IKE over TCP where UDP 500/4500 is blocked, with version-specific settings), Agentless VPN (formerly SSL VPN web mode; model-dependent), ADVPN, BGP, OSPF, RIP, hardware sizing, VM deployment, and FortiOS CLI troubleshooting.

SSL VPN tunnel mode is removed on all models from FortiOS 7.6.3, and Agentless VPN is unavailable on 2 GB RAM and entry-level models (check the release notes for the exact model list). Treat any remaining SSL VPN deployment as a migration item that must be completed before upgrading.

Sizing must consider throughput with security profiles enabled, SSL inspection mode, session count, interface speed, NP/CP offload, logging volume, HA requirements, and growth. Do not size only from firewall throughput datasheet numbers.

## FortiManager

Recommend for centralized device, policy, object, ADOM, SD-WAN overlay template, VPN template, workflow, and change-control needs. In multi-site environments, emphasize policy package governance and avoiding object drift.

Discuss FortiManager Cloud vs on-prem by compliance, connectivity, operations ownership, DR requirement, and administrative boundaries.

## FortiAnalyzer

Position as Fortinet ecosystem log analytics, reporting, SOC view, incident workflow, compliance reports, and FortiAnalyzer playbook automation. Discuss ADOM design, quota, retention, log ingestion rate, storage, and archive policy.

## FortiSIEM and FortiSOAR

Use FortiSIEM for multi-vendor SIEM, asset discovery, CMDB, rule correlation, business service modeling, compliance, and SOC-wide monitoring.

Use FortiSOAR for incident response orchestration, connector-driven automation, playbooks with approval nodes, War Room collaboration, timeline, SLA, and KPI tracking.

## FortiAP and FortiSwitch

For access networks, include SSID/VLAN design, guest isolation, Rogue AP/WIDS, FortiGate wireless controller mode, FortiLink, VLAN, STP, LACP/MCLAG, 802.1X, PoE budget, and operational blast radius.

## FortiEDR, FortiEndpoint, and FortiXDR

Position FortiEDR as behavior detection, prevention, automated isolation, and endpoint telemetry. FortiEDR is also packaged in FortiEndpoint, the unified agent that combines FortiClient, FortiEDR, and FortiDLP under one license; there is no in-place upgrade from FortiEDR to FortiEndpoint, so check the current ordering guide before quoting SKUs. Position FortiXDR as cross-Fabric correlation and incident scoring. Mention Defender honestly as a baseline control, then explain what Fabric integration adds.

## FortiWeb, FortiMail, and FortiSandbox

FortiWeb: Reverse Proxy, True Transparent Proxy, Offline, OWASP Top 10 tuning, ML anomaly detection, API schema validation, and FortiAppSec Cloud (which absorbed FortiWeb Cloud, FortiGSLB Cloud, and Advanced Bot Protection from 2024-12-01).

FortiMail: Gateway, Transparent, Server mode, anti-spam, anti-phishing, DKIM, DMARC, SPF, FortiSandbox integration, and BEC protection.

FortiSandbox: Appliance, VM, FortiSandbox PaaS (standalone cloud), the FortiSandbox Cloud service for FortiGate, integration with FortiGate/FortiMail/FortiWeb, custom VM images, timeout tuning, and FortiGuard feedback.

## Identity and Endpoint Access

FortiNAC-F (recommended for new deployments; legacy CentOS-based FortiNAC 9.4 reaches end of support on 2026-11-13): profiling, 802.1X, MAC-based authentication, BYOD/IoT isolation, guest portal, and FortiGate ZTNA Tag integration.

FortiAuthenticator/FortiToken: RADIUS, LDAP, SAML, MFA, self-service portal, IPsec dial-up VPN, Agentless VPN, FortiSASE, and ZTNA integration.

FortiClient EMS: VPN profile deployment, Fabric Agent, endpoint compliance, ZTNA tags, and telemetry.

## SD-WAN, SASE, Cloud, and Automation

SD-WAN design must ask for branch count, transport types, hub locations, SaaS usage, link quality, SLA probes, routing design, and failover requirements before recommending Hub-and-Spoke, Full Mesh, or Partial Mesh.

Cloud and hybrid topics include FortiGate-VM on AWS/Azure/GCP/OCI, FortiSASE (FortiSASE Sovereign licensing for FortiGate 91G/901G added in FortiOS 7.6.5; FortiSASE Outpost announced 2026-07-28), FortiCASB-SSPM, Lacework FortiCNAPP (FortiCNP is EOL), Terraform provider for FortiOS/FortiManager, Ansible Fortinet collections, FortiGate REST API, FortiManager/FortiAnalyzer JSON-RPC API, and CI/CD governance.

FortiGate CNF is marked End of Order (BYOL SKU End of Order 2026-06-22, support until 2027-06-22); verify lifecycle status before proposing it. For the FortiGate REST API, send API tokens in the `Authorization: Bearer` header; passing the key as a URL query parameter is disabled by default on newer builds (`rest-api-key-url-query`).
