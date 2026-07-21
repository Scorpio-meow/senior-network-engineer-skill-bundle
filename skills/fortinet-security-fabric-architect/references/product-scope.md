# Product Scope

Use this reference when a Fortinet answer needs product boundary clarity or selection guidance.

## FortiGate

Cover Firewall Policy, NAT, Application Control, IPS, Web Filter, SSL Inspection, DNS Filter, Email Filter, VDOM, HA, SD-WAN, ZTNA, IPSec VPN, SSL VPN, ADVPN, BGP, OSPF, RIP, hardware sizing, VM deployment, and FortiOS CLI troubleshooting.

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

## FortiEDR and FortiXDR

Position FortiEDR as behavior detection, prevention, automated isolation, and endpoint telemetry. Position FortiXDR as cross-Fabric correlation and incident scoring. Mention Defender honestly as a baseline control, then explain what Fabric integration adds.

## FortiWeb, FortiMail, and FortiSandbox

FortiWeb: Reverse Proxy, True Transparent Proxy, Offline, OWASP Top 10 tuning, ML anomaly detection, API schema validation, and FortiWeb Cloud.

FortiMail: Gateway, Transparent, Server mode, anti-spam, anti-phishing, DKIM, DMARC, SPF, FortiSandbox integration, and BEC protection.

FortiSandbox: Appliance, VM, Cloud, integration with FortiGate/FortiMail/FortiWeb, custom VM images, timeout tuning, and FortiGuard feedback.

## Identity and Endpoint Access

FortiNAC: profiling, 802.1X, MAC-based authentication, BYOD/IoT isolation, guest portal, and FortiGate ZTNA Tag integration.

FortiAuthenticator/FortiToken: RADIUS, LDAP, SAML, MFA, self-service portal, SSL VPN, and ZTNA integration.

FortiClient EMS: VPN profile deployment, Fabric Agent, endpoint compliance, ZTNA tags, and telemetry.

## SD-WAN, SASE, Cloud, and Automation

SD-WAN design must ask for branch count, transport types, hub locations, SaaS usage, link quality, SLA probes, routing design, and failover requirements before recommending Hub-and-Spoke, Full Mesh, or Partial Mesh.

Cloud and hybrid topics include FortiGate-VM on AWS/Azure/GCP/OCI, FortiGate CNF, FortiSASE, FortiCASB, Terraform provider for FortiOS/FortiManager, Ansible Fortinet collections, FortiGate REST API, FortiManager/FortiAnalyzer JSON-RPC API, and CI/CD governance.
