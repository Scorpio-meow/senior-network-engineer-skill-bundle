# Senior Network Engineer Skill Bundle

[繁體中文](../README.md) | [English](README.en.md) | [简体中文](README.zh-CN.md) | [粵語](README.yue.md) | [日本語](README.ja.md) | **한국어** | [Español](README.es.md) | [Português (Brasil)](README.pt-BR.md) | [Français](README.fr.md) | [Deutsch](README.de.md) | [Русский](README.ru.md) | [Tiếng Việt](README.vi.md) | [Bahasa Indonesia](README.id.md) | [ไทย](README.th.md) | [Türkçe](README.tr.md) | [العربية](README.ar.md)

시니어 네트워크 엔지니어를 위한 개인용 스킬 번들입니다. 멀티 벤더 주 스킬 1개와 벤더별 subskill 4개로 구성되며, 여러 컴퓨터와 AI 도구가 하나의 source of truth를 공유할 수 있도록 단일 Git 저장소에서 관리합니다.

스킬은 [Agent Skills open format](https://agentskills.io/specification)을 따르며(각 폴더에 `SKILL.md`와 선택 사항인 `references/`가 포함됨), Claude, ChatGPT/Codex, Google Antigravity, Gemini CLI, Cursor, GitHub Copilot 등 이 형식을 지원하는 도구에 설치할 수 있습니다.

시효성 있는 내용(버전, EoL, CVE, PQC, AI 도구 기능 및 설치 경로)은 **2026-09-27** 기준으로 검증되었습니다.

> **언어 안내:** 스킬 본문은 번체 중국어로 작성되어 있으며, 기본적으로 AI가 대만 기업 IT 용어를 사용해 번체 중국어로 답변하도록 지시합니다. 다른 언어로 답변을 받으려면 요청에 해당 언어를 명시하세요.

## 목차

- [포함된 스킬](#포함된-스킬)
- [디렉터리 구조](#디렉터리-구조)
- [설치 전 확인 사항](#설치-전-확인-사항)
- [공통 설치 명령](#공통-설치-명령)
- [플랫폼별 설치](#플랫폼별-설치)
- [사용 방법](#사용-방법)
- [업데이트](#업데이트)
- [시효성 정보](#시효성-정보)
- [유지보수 규칙](#유지보수-규칙)

## 포함된 스킬

| 스킬 | 범위 |
|---|---|
| `senior-network-engineer` | 주 스킬. 멀티 벤더 아키텍처 및 트러블슈팅, 패킷/session 분석, HA/DR, CVE 및 버전 거버넌스, PQC, CEH/CISSP 보안 기초, AI Agent/MCP 거버넌스, 고객 및 벤더 커뮤니케이션, HLD/LLD/MOP/RCA 및 교육 훈련을 다루며, 질문을 아래 subskill로 라우팅합니다 |
| `palo-alto-architect` | PAN-OS NGFW, Panorama, Strata Cloud Manager, Prisma SASE, Cortex(XDR/XSIAM/XSOAR/AgentiX/Cortex Cloud), CVE 및 PQC |
| `fortinet-security-fabric-architect` | FortiGate/FortiOS, FortiManager, FortiAnalyzer, SD-WAN, ZTNA, SSL VPN에서 IPsec으로의 마이그레이션, PSIRT 및 PQC/QKD |
| `cisco-network-dc-architect` | Catalyst, Nexus/Nexus Dashboard, ACI, VXLAN EVPN, Catalyst SD-WAN, 9800/CW9800 WLC, ISE, Secure Firewall, PSIRT 및 PQC/MACsec |
| `hpe-aruba-network-architect` | AOS-8/AOS-10, Instant AOS-8, HPE Aruba Networking Central, ClearPass, AOS-CX/AOS-Switch, HPE Security Bulletins 및 PPK/PQC |

## 디렉터리 구조

```text
.
├── README.md                             # 번체 중국어(원본)
├── README/                               # 번역본(15개 언어)
│   └── README.<lang>.md
├── bundle-manifest.json                  # 번들 이름, 버전 및 스킬 목록
└── skills/
    ├── senior-network-engineer/
    │   ├── SKILL.md
    │   └── references/
    │       ├── advanced-troubleshooting.md
    │       ├── ai-assisted-network-engineering.md
    │       ├── deliverables-and-training.md
    │       ├── principal-architect-personalization.md
    │       ├── security-foundations.md
    │       └── stakeholder-communication.md
    ├── palo-alto-architect/
    │   └── SKILL.md
    ├── fortinet-security-fabric-architect/
    │   ├── SKILL.md
    │   └── references/
    │       ├── field-playbooks.md
    │       └── product-scope.md
    ├── cisco-network-dc-architect/
    │   └── SKILL.md
    └── hpe-aruba-network-architect/
        └── SKILL.md
```

## 설치 전 확인 사항

1. **5개 스킬을 모두 같은 폴더에 설치하세요.** 주 스킬은 상대 경로 `../<subskill>/SKILL.md`로 subskill을 로드하므로, 5개 폴더가 나란히 있어야만 경로가 올바르게 해석됩니다.
2. **폴더 이름을 변경하지 마세요.** 대부분의 도구는 폴더 이름이 `SKILL.md`의 `name`과 일치해야 하며, 일치하지 않으면 해당 스킬을 경고 없이 건너뛸 수 있습니다.
3. **업로드 방식 플랫폼(Claude 웹/데스크톱, ChatGPT 웹)에서는 5개를 모두 업로드하고 활성화하세요.** 이러한 플랫폼에서는 각 스킬이 독립적으로 동작합니다. Anthropic Help Center에 따르면 스킬은 다른 스킬을 명시적으로 참조할 수 없지만, Claude는 필요에 따라 여러 스킬을 자동으로 조합해 사용합니다.
4. **한 번 설치하고 여러 도구에서 공유하세요.** `~/.agents/skills`는 Codex/ChatGPT 데스크톱, Cursor, GitHub Copilot, Gemini CLI가 공통으로 읽는 도구 간 공용 위치입니다. Claude Code와 Antigravity는 각자의 디렉터리가 필요합니다.

## 공통 설치 명령

먼저 이 저장소를 clone한 다음, 저장소 루트에서 명령을 실행하세요. `$dest` / `DEST`는 다음 섹션의 표에서 해당 플랫폼의 경로로 바꾸세요.

**Windows (PowerShell)**

```powershell
git clone https://github.com/Scorpio-meow/senior-network-engineer-skill-bundle.git
Set-Location senior-network-engineer-skill-bundle

$dest = Join-Path $HOME '.agents/skills'      # 플랫폼에 맞게 변경
New-Item -ItemType Directory -Path $dest -Force | Out-Null

# 방법 1: 복사(호환성이 가장 좋음, 업데이트할 때마다 다시 복사)
Copy-Item ./skills/* $dest -Recurse -Force

# 방법 2: Junction(저장소 수정 사항이 즉시 반영됨, 링크를 공식 지원하는 도구에만 사용)
Get-ChildItem ./skills -Directory | ForEach-Object {
    New-Item -ItemType Junction -Path (Join-Path $dest $_.Name) -Target $_.FullName
}
```

**macOS / Linux**

```bash
git clone https://github.com/Scorpio-meow/senior-network-engineer-skill-bundle.git
cd senior-network-engineer-skill-bundle

DEST=~/.agents/skills        # 플랫폼에 맞게 변경
mkdir -p "$DEST"

# 방법 1: 복사
cp -R skills/* "$DEST/"

# 방법 2: 심볼릭 링크(링크를 공식 지원하는 도구에만 사용)
for d in "$PWD"/skills/*/; do ln -s "${d%/}" "$DEST/"; done
```

대상 위치에 같은 이름의 폴더가 이미 있으면 링크 생성이 실패합니다. 먼저 기존 버전을 직접 백업하거나 삭제하세요.

## 플랫폼별 설치

### 빠른 참조

| 플랫폼 | 개인(전역) 경로 | 프로젝트 경로 | 링크 지원 | 수동 호출 |
|---|---|---|---|---|
| Claude Code | `~/.claude/skills` | `.claude/skills` | 예 | `/senior-network-engineer` |
| Claude 웹/데스크톱 | ZIP 업로드(아래 참조) | — | — | `/` 입력 후 선택 |
| ChatGPT 데스크톱, Codex CLI/IDE | `~/.agents/skills` | `.agents/skills` | 예 | ChatGPT: `@`; Codex: `$senior-network-engineer` 또는 `/skills` |
| ChatGPT 웹 | 업로드(아래 참조) | — | — | 자동 또는 `@` |
| Antigravity 2.0 / IDE | `~/.gemini/config/skills` | `.agents/skills` | 문서화되지 않음 | `/senior-network-engineer` |
| Antigravity CLI | `~/.gemini/antigravity-cli/skills` | `.agents/skills` | 문서화되지 않음 | `/senior-network-engineer` |
| Gemini CLI | `~/.gemini/skills` 또는 `~/.agents/skills` | `.gemini/skills` 또는 `.agents/skills` | 예 | 자동(`/skills list`로 확인) |
| Cursor | `~/.cursor/skills` 또는 `~/.agents/skills` | `.cursor/skills` 또는 `.agents/skills` | 문서화되지 않음 | Agent 채팅에서 `/` 입력 |
| GitHub Copilot (VS Code, CLI) | `~/.copilot/skills` 또는 `~/.agents/skills` | `.github/skills` 또는 `.agents/skills` | 문서화되지 않음 | `/senior-network-engineer` |
| Hermes Agent | `~/.hermes/skills/<category>` | `.hermes/skills` 또는 `.agents/skills` | 문서화되지 않음 | `/senior-network-engineer` |

모든 도구는 스킬의 description이 작업과 일치하면 해당 스킬을 자동으로 로드합니다. "문서화되지 않음"으로 표시된 도구는 공식 문서에 링크 지원 여부가 명시되어 있지 않으므로 복사 방식으로 설치하세요.

### Claude Code

```bash
DEST=~/.claude/skills        # 프로젝트 범위는 .claude/skills 사용
```

- 공통 명령으로 복사하거나 링크하세요(공식 문서에서 링크를 명시적으로 지원함).
- 변경 사항은 현재 session에 자동으로 반영됩니다. 시작 시점에 `~/.claude/skills`가 없었다면 `/reload-skills`를 실행하세요.
- `/skills`를 입력하면 로드된 스킬을 확인할 수 있습니다.
- `~/.claude/skills`는 로컬 Claude Code에만 적용되며, Cowork나 클라우드 session에는 적용되지 않습니다.

### Claude (claude.ai 웹, 데스크톱)

유료 플랜(Pro, Max, Team, Enterprise)에서 사용할 수 있습니다.

1. 코드 실행을 활성화하세요: **Settings > Capabilities > Code execution and file creation**. Team/Enterprise에서는 Owner가 **Organization settings > Plugins & skills**에서 Skills와 코드 실행을 활성화해야 합니다.
2. 5개 스킬을 각각 별도의 ZIP으로 패키징하세요. ZIP 내부의 최상위는 스킬 폴더 자체여야 하며(예: `palo-alto-architect/SKILL.md`), `SKILL.md`를 ZIP 루트에 바로 두지 마세요.

   ```bash
   mkdir -p dist && cd skills
   for s in */; do zip -r "../dist/${s%/}.zip" "${s%/}"; done
   cd .. && unzip -l dist/senior-network-engineer.zip   # 모든 항목이 senior-network-engineer/로 시작해야 함
   ```

   ```powershell
   # Windows에서는 PowerShell 7(pwsh)을 사용하세요. Windows PowerShell 5.1의 Compress-Archive는 호환되지 않는 경로 형식을 생성할 수 있습니다
   New-Item -ItemType Directory -Path dist -Force | Out-Null
   Get-ChildItem ./skills -Directory | ForEach-Object {
       Compress-Archive -Path $_.FullName -DestinationPath "dist/$($_.Name).zip" -Force
   }
   ```

3. **Customize > Skills**로 이동하여 **+** → **Create skill** → **Upload a skill**을 선택하고, 5개 ZIP을 하나씩 업로드한 뒤 모두 활성화하세요.
4. 대화에서 작업 내용을 설명하면 자동으로 사용되며, 입력창에 `/`를 입력해 스킬을 직접 선택할 수도 있습니다.

**Description 길이 제한:** Claude Help Center에서는 description을 200자로 제한합니다(claude.com 개발자 문서와 Agent Skills 사양은 1,024자까지 허용). 이 번들은 더 엄격한 200자 제한을 따르며, 5개 description은 각각 161–177자입니다.

**대안: 5개 스킬을 plugin으로 한 번에 업로드**(Pro 플랜 이상). Claude plugin에는 `.claude-plugin/plugin.json` manifest가 필요하지만 이 저장소에는 포함되어 있지 않으므로, 패키징할 때 생성하세요.

```bash
mkdir -p dist/snet-plugin/.claude-plugin
cp -R skills dist/snet-plugin/
cat > dist/snet-plugin/.claude-plugin/plugin.json <<'EOF'
{
  "name": "senior-network-engineer-bundle",
  "description": "Senior network engineer skills for Palo Alto, Fortinet, Cisco and HPE Aruba",
  "version": "2026.09.27"
}
EOF
(cd dist/snet-plugin && zip -r ../senior-network-engineer-bundle.zip .)
```

그런 다음 **Customize > Plugins**에서 `dist/senior-network-engineer-bundle.zip`을 업로드하세요.

### ChatGPT

**ChatGPT 데스크톱:** Codex와 로컬 스킬을 공유하므로 `~/.agents/skills`에 설치하기만 하면 됩니다(다음 섹션 참조). ChatGPT에서 `@`를 입력해 스킬을 선택하세요.

**ChatGPT 웹:** Business, Enterprise, Healthcare, Edu 플랜으로 제한되며, workspace 관리자 설정의 영향을 받습니다.

1. 사이드바에서 **Plugins**를 선택하세요.
2. **Plugin Directory**에서 **Skills** 탭을 여세요.
3. **Create** → **Upload from your computer**를 선택하고 5개 스킬을 하나씩 업로드하세요. ChatGPT는 업로드된 파일을 먼저 검사하며, 결과로 "Needs Review" 또는 "Blocked"가 표시될 수 있습니다.

OpenAI 공식 문서에는 업로드 파일 형식이 명시되어 있지 않습니다. 먼저 이전 섹션의 스킬별 ZIP을 시도하고, 받아들여지지 않으면 업로드 화면의 안내에 따라 조정하세요.

### OpenAI Codex (CLI, IDE extension)

```bash
DEST=~/.agents/skills        # 프로젝트 범위는 저장소 내부의 .agents/skills 사용
```

- 공통 명령으로 복사하거나 링크하세요(공식 문서에서 링크를 명시적으로 지원함).
- Codex는 스킬 변경을 자동으로 감지합니다. 표시되지 않으면 Codex를 재시작하세요.
- `$senior-network-engineer`로 호출하거나, `/skills`를 실행해 선택하세요.
- 이전 경로 `$CODEX_HOME/skills`(`CODEX_HOME`이 설정되지 않은 경우 `~/.codex/skills`)는 공식 문서에서 삭제되었지만, Codex는 여전히 deprecated 경로로 로드합니다. 그곳에 이 번들의 다른 사본이 남아 있으면 같은 이름의 스킬이 두 번 표시되므로, 이전 설치본을 제거하세요.

### Google Antigravity (2.0, IDE, CLI)

```bash
DEST=~/.gemini/config/skills                # Antigravity 2.0 및 IDE(전역)
DEST=~/.gemini/antigravity-cli/skills       # Antigravity CLI(전역)
DEST=<프로젝트-루트>/.agents/skills         # 세 가지 모두 공유하는 프로젝트 범위
```

- 세 가지 인터페이스는 서로 다른 전역 경로를 사용합니다. 2.0/IDE와 CLI를 모두 사용한다면 두 전역 경로 모두에 설치하거나, 대신 프로젝트 범위의 `.agents/skills`를 사용하세요.
- IDE는 이전 경로 `~/.gemini/antigravity/skills`도 계속 지원합니다.
- Gemini CLI에서 마이그레이션하는 경우: `~/.gemini/skills`는 `~/.gemini/antigravity-cli/skills`에 대응되며, 프로젝트의 `.gemini/skills`는 수동으로 `.agents/skills`로 이름을 바꾸거나 옮겨야 합니다.
- CLI는 plugin 방식으로도 설치할 수 있습니다. `plugin.json`과 `skills/`가 포함된 폴더를 만든 뒤 `agy plugin install <plugin-폴더>`를 실행하고, TUI에서 `/skills`를 입력하면 로드된 스킬을 확인할 수 있습니다.

### Gemini CLI

Gemini CLI는 2026-06-18부로 개인 사용자 대상 서비스를 종료했습니다(Antigravity CLI로 대체). Gemini Code Assist Standard/Enterprise 라이선스와 유료 Gemini API 키 사용자만 계속 사용할 수 있습니다.

```bash
DEST=~/.gemini/skills        # 또는 ~/.agents/skills, 프로젝트 범위는 .gemini/skills 또는 .agents/skills 사용
```

- 공식 명령 `gemini skills link ./skills`로 링크를 생성할 수도 있습니다.
- session에서 `/skills reload`를 실행하면 새 스킬을 로드하고, `/skills list`로 확인할 수 있습니다.
- 스킬 폴더에 대한 파일 접근 권한은 스킬이 활성화될 때만 부여되므로, 주 스킬이 subskill을 읽을 때 권한 확인 프롬프트가 표시될 수 있습니다.

### Cursor

```bash
DEST=~/.cursor/skills        # 또는 ~/.agents/skills, 프로젝트 범위는 .cursor/skills 또는 .agents/skills 사용
```

- Cursor는 시작 시 스킬을 자동으로 검색합니다. **Customize → Skills**에서 확인하세요.
- Agent 채팅에서 `/`를 입력하고 스킬을 선택해 호출하세요.
- `~/.cursor/skills`만 Cloud Agents와 동기화됩니다(**Settings → Agents**에서 **Sync Skills for Cloud Agents** 활성화). `~/.agents/skills`는 Cloud Agents나 원격 SSH와 동기화되지 않습니다.

### GitHub Copilot (VS Code agent mode, Copilot CLI)

```bash
DEST=~/.copilot/skills       # 또는 ~/.agents/skills, 프로젝트 범위는 .github/skills 또는 .agents/skills 사용
```

- Copilot 라이선스가 조직 또는 엔터프라이즈에서 제공되는 경우, 관리자가 정책에서 관련 기능을 허용해야 합니다.
- VS Code: Chat에서 `/skills`를 입력하면 스킬 설정이 열립니다. Copilot CLI: `/skills list`, `/skills reload`.
- Copilot cloud agent와 code review는 GitHub에서 실행되며, 저장소 내부의 스킬(프로젝트 범위)만 읽습니다.

### Hermes Agent

```bash
DEST=~/.hermes/skills/network   # 5개 스킬을 모두 같은 카테고리 폴더에 배치
```

- 새 스킬은 새 session에서 적용됩니다(또는 `/reset` 실행).
- 프로젝트의 `.hermes/skills`와 `.agents/skills`는 해당 저장소에서 `hermes skills trust`를 실행한 후에만 로드됩니다.
- 스킬이 이미 `~/.agents/skills`에 설치되어 있다면, `~/.hermes/config.yaml`의 `skills.external_dirs`에 해당 경로를 추가해 공유하세요.
- `hermes skills install`로 GitHub에서 하나씩 설치하는 방식은 권장하지 않습니다. `SKILL.md`가 직접 참조하는 파일만 복사하므로 스킬 간 `../` 참조 파일은 다운로드되지 않습니다.

## 사용 방법

작업 내용을 설명하면 도구가 description을 기준으로 스킬을 자동 선택합니다. 특정 스킬을 명시적으로 지정하려면 플랫폼에서 지원하는 방식으로 호출하세요(빠른 참조 표 참조). 예를 들어 Codex에서는 다음과 같습니다.

```text
$senior-network-engineer 이 멀티 벤더 네트워크 장애를 분석해 주세요. 먼저 증거와 가설을 나열한 다음, 롤백 계획을 포함한 MOP를 제시해 주세요. 한국어로 답변해 주세요.
```

단일 벤더 관련 질문은 `palo-alto-architect`, `fortinet-security-fabric-architect`, `cisco-network-dc-architect`, `hpe-aruba-network-architect` 등의 subskill을 직접 호출할 수 있습니다.

## 업데이트

변경 작업을 한 컴퓨터에서:

```bash
git status --short
git add -- <실제로-변경한-파일>
git commit -m "<단일 목적의 설명>"
git push
```

다른 컴퓨터에서:

```bash
git pull --ff-only
```

- 링크로 설치한 도구: pull 직후 변경 사항이 반영됩니다.
- 복사로 설치한 도구: pull 후 복사 명령을 다시 실행하세요.
- 업로드 방식 플랫폼(Claude, ChatGPT 웹): 변경된 스킬을 다시 패키징해 재업로드하세요.

## 시효성 정보

- 버전, EoL/EoS, CVE, Recommended Releases, PQC 지원 및 AI 도구 기능은 벤더 또는 공식 문서를 근거로 하며, 본문에 검증 날짜를 표기했습니다.
- AI 도구의 스킬 경로와 업로드 절차는 자주 변경됩니다. 이 문서는 2026-09-27 기준 공식 문서를 반영하고 있으므로, 설치 후 스킬이 로드되지 않으면 먼저 해당 도구의 최신 문서를 확인하세요.
- 검증 시점에 다음 항목은 공식 페이지가 벤더 지원 포털 로그인을 요구하여 서드파티 또는 커뮤니티 출처에서만 확인할 수 있었습니다. 스킬 본문에서는 이를 "인용 전 재검증 필요"로 표시합니다.
  - FortiNAC 9.4 EoS 및 FortiGate CNF End of Order 날짜(Fortinet Product Life Cycle, FortiCare 계정 필요)
  - AirWave 소프트웨어 EoS 및 2930F/2930M/5400R의 판매 종료 상태(HPE Networking Support Portal)
- 시효성 있는 내용을 업데이트할 때는 해당 섹션의 검증 날짜와 `bundle-manifest.json`의 `version`도 함께 업데이트하세요.

## 유지보수 규칙

- 원본 스킬은 `skills/` 안에서만 수정하고, 설치 위치의 사본은 수정하지 마세요.
- 5개 스킬은 같은 계층에 두고, `SKILL.md`는 500줄 이내로 간결하게 유지하며 세부 내용은 한 단계 깊이의 `references/`에 두세요.
- frontmatter의 `name`은 폴더 이름과 일치해야 하며, `description`은 200자 이하(Claude Help Center 업로드 제한에 맞춤)로 스킬의 기능과 트리거 조건을 모두 기술해야 합니다.
- CVE, fixed release, EoL, PQC, CLI, 라이선스 또는 AI 플랫폼 기능을 기억에 의존해 단정하지 말고, 벤더 또는 공식 문서를 근거로 삼아 검증 날짜를 기록하세요.
- 고객 설정, PCAP, 계정, 비밀번호, PSK, 개인 키, API 토큰, 라이선스 또는 티켓 첨부 파일을 커밋하지 마세요.
- 고위험 권고에는 반드시 증거, blast radius, 중단 조건, 롤백 및 검증 절차를 포함해야 합니다.
- `README.md`(번체 중국어)가 원본 README입니다. 이를 변경할 때는 같은 커밋에서 모든 `README/README.<lang>.md` 번역본을 함께 업데이트하세요.
