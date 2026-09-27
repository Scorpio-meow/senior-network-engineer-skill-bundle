# Senior Network Engineer Skill Bundle

[繁體中文](../README.md) | [English](README.en.md) | **简体中文** | [粵語](README.yue.md) | [日本語](README.ja.md) | [한국어](README.ko.md) | [Español](README.es.md) | [Português (Brasil)](README.pt-BR.md) | [Français](README.fr.md) | [Deutsch](README.de.md) | [Русский](README.ru.md) | [Tiếng Việt](README.vi.md) | [Bahasa Indonesia](README.id.md) | [ไทย](README.th.md) | [Türkçe](README.tr.md) | [العربية](README.ar.md)

个人使用的资深网络工程师 Skill 套件：一个跨厂商主 Skill 加上四个厂商 subskill，集中在同一个 Git 仓库中，让多台电脑、多种 AI 工具共用同一份正本。

Skill 采用 [Agent Skills 开放格式](https://agentskills.io/specification)（文件夹内含 `SKILL.md` 与可选的 `references/`），可安装到 Claude、ChatGPT/Codex、Google Antigravity、Gemini CLI、Cursor、GitHub Copilot 等支持此格式的工具。

时效性内容（版本、EoL、CVE、PQC、AI 工具能力与安装路径）的核查基准日为 **2026-09-27**。

> **语言说明：** Skill 正文以繁体中文撰写，并指示 AI 默认使用繁体中文与台湾企业 IT 术语回答。如需其他语言，请在请求中明确说明。

## 目录

- [包含的 Skill](#包含的-skill)
- [目录结构](#目录结构)
- [安装前须知](#安装前须知)
- [通用安装命令](#通用安装命令)
- [各平台安装](#各平台安装)
- [使用方式](#使用方式)
- [更新](#更新)
- [时效性信息](#时效性信息)
- [维护规则](#维护规则)

## 包含的 Skill

| Skill | 涵盖范围 |
|---|---|
| `senior-network-engineer` | 主 Skill。跨厂商架构与排障、数据包/session 分析、HA/DR、CVE 与版本治理、PQC、CEH/CISSP 安全基础、AI Agent/MCP 治理、客户与原厂沟通、HLD/LLD/MOP/RCA 与培训；按问题路由至下列 subskill |
| `palo-alto-architect` | PAN-OS NGFW、Panorama、Strata Cloud Manager、Prisma SASE、Cortex（XDR/XSIAM/XSOAR/AgentiX/Cortex Cloud）、CVE 与 PQC |
| `fortinet-security-fabric-architect` | FortiGate/FortiOS、FortiManager、FortiAnalyzer、SD-WAN、ZTNA、SSL VPN 至 IPsec 迁移、PSIRT 与 PQC/QKD |
| `cisco-network-dc-architect` | Catalyst、Nexus/Nexus Dashboard、ACI、VXLAN EVPN、Catalyst SD-WAN、9800/CW9800 WLC、ISE、Secure Firewall、PSIRT 与 PQC/MACsec |
| `hpe-aruba-network-architect` | AOS-8/AOS-10、Instant AOS-8、HPE Aruba Networking Central、ClearPass、AOS-CX/AOS-Switch、HPE Security Bulletin 与 PPK/PQC |

## 目录结构

```text
.
├── README.md                             # 繁体中文（正本）
├── README/                               # 翻译版（15 种语言）
│   └── README.<lang>.md
├── bundle-manifest.json                  # 套件名称、版本与 Skill 列表
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

## 安装前须知

1. **五个 Skill 一起安装到同一个文件夹。** 主 Skill 以相对路径 `../<subskill>/SKILL.md` 加载 subskill，只有五个文件夹并排时才能找到。
2. **不要修改文件夹名称。** 多数工具要求文件夹名称与 `SKILL.md` 的 `name` 一致，不一致时可能直接跳过不加载。
3. **以上传方式安装的平台（Claude 网页版/桌面版、ChatGPT 网页版）五个都要上传并启用。** 这类平台中每个 Skill 各自独立，Anthropic 帮助中心表示 Skill 无法显式引用其他 Skill，但 Claude 会自动组合使用多个 Skill。
4. **一次安装、多工具共用。** `~/.agents/skills` 是跨工具的共用位置，Codex/ChatGPT 桌面版、Cursor、GitHub Copilot、Gemini CLI 都会读取；Claude Code 与 Antigravity 则需要安装到各自的目录。

## 通用安装命令

先 clone 本仓库，然后在仓库根目录执行。把 `$dest`／`DEST` 换成下一节各平台对照表中的路径。

**Windows（PowerShell）**

```powershell
git clone https://github.com/Scorpio-meow/senior-network-engineer-skill-bundle.git
Set-Location senior-network-engineer-skill-bundle

$dest = Join-Path $HOME '.agents/skills'      # 按平台替换
New-Item -ItemType Directory -Path $dest -Force | Out-Null

# 方式一：复制（兼容性最好；更新后需重新复制）
Copy-Item ./skills/* $dest -Recurse -Force

# 方式二：创建 Junction（仓库修改立即生效；仅适用于官方标明支持链接的工具）
Get-ChildItem ./skills -Directory | ForEach-Object {
    New-Item -ItemType Junction -Path (Join-Path $dest $_.Name) -Target $_.FullName
}
```

**macOS / Linux**

```bash
git clone https://github.com/Scorpio-meow/senior-network-engineer-skill-bundle.git
cd senior-network-engineer-skill-bundle

DEST=~/.agents/skills        # 按平台替换
mkdir -p "$DEST"

# 方式一：复制
cp -R skills/* "$DEST/"

# 方式二：符号链接（仅适用于官方标明支持链接的工具）
for d in "$PWD"/skills/*/; do ln -s "${d%/}" "$DEST/"; done
```

目标位置已有同名文件夹时，创建链接会失败；请先自行备份或删除旧版本。

## 各平台安装

### 快速对照

| 平台 | 个人（全局）路径 | 项目路径 | 支持链接 | 手动调用 |
|---|---|---|---|---|
| Claude Code | `~/.claude/skills` | `.claude/skills` | 是 | `/senior-network-engineer` |
| Claude 网页版/桌面版 | 上传 ZIP（见下方） | — | — | 输入 `/` 选择 |
| ChatGPT 桌面版、Codex CLI/IDE | `~/.agents/skills` | `.agents/skills` | 是 | ChatGPT：`@`；Codex：`$senior-network-engineer` 或 `/skills` |
| ChatGPT 网页版 | 上传（见下方） | — | — | 自动或 `@` |
| Antigravity 2.0 / IDE | `~/.gemini/config/skills` | `.agents/skills` | 未记载 | `/senior-network-engineer` |
| Antigravity CLI | `~/.gemini/antigravity-cli/skills` | `.agents/skills` | 未记载 | `/senior-network-engineer` |
| Gemini CLI | `~/.gemini/skills` 或 `~/.agents/skills` | `.gemini/skills` 或 `.agents/skills` | 是 | 自动（`/skills list` 查看） |
| Cursor | `~/.cursor/skills` 或 `~/.agents/skills` | `.cursor/skills` 或 `.agents/skills` | 未记载 | 在 Agent chat 输入 `/` |
| GitHub Copilot（VS Code、CLI） | `~/.copilot/skills` 或 `~/.agents/skills` | `.github/skills` 或 `.agents/skills` | 未记载 | `/senior-network-engineer` |
| Hermes Agent | `~/.hermes/skills/<分类>` | `.hermes/skills` 或 `.agents/skills` | 未记载 | `/senior-network-engineer` |

所有工具在描述匹配时也会自动加载 Skill。标示“未记载”的工具，官方文档没有说明是否支持链接，建议用复制方式安装。

### Claude Code

```bash
DEST=~/.claude/skills        # 项目范围改用 .claude/skills
```

- 使用通用命令复制或创建链接（官方文档明确支持链接）。
- 修改会在当前 session 内自动生效；若 `~/.claude/skills` 在启动时尚不存在，执行 `/reload-skills`。
- 输入 `/skills` 可查看已加载的 Skill。
- `~/.claude/skills` 只作用于本机的 Claude Code，不包含 Cowork 与云端 session。

### Claude（claude.ai 网页版、桌面版）

适用于付费方案（Pro、Max、Team、Enterprise）。

1. 开启代码执行：**Settings > Capabilities > Code execution and file creation**。Team/Enterprise 需由 Owner 在 **Organization settings > Plugins & skills** 开启 Skills 与代码执行。
2. 将五个 Skill 各自打包成 ZIP。ZIP 内的最上层必须是 Skill 文件夹本身（例如 `palo-alto-architect/SKILL.md`），不能把 `SKILL.md` 直接放在 ZIP 根目录。

   ```bash
   mkdir -p dist && cd skills
   for s in */; do zip -r "../dist/${s%/}.zip" "${s%/}"; done
   cd .. && unzip -l dist/senior-network-engineer.zip   # 每一行都应以 senior-network-engineer/ 开头
   ```

   ```powershell
   # Windows 请用 PowerShell 7（pwsh）执行，Windows PowerShell 5.1 的 Compress-Archive 生成的路径格式可能不兼容
   New-Item -ItemType Directory -Path dist -Force | Out-Null
   Get-ChildItem ./skills -Directory | ForEach-Object {
       Compress-Archive -Path $_.FullName -DestinationPath "dist/$($_.Name).zip" -Force
   }
   ```

3. 前往 **Customize > Skills**，选择 **+** → **Create skill** → **Upload a skill**，依次上传五个 ZIP，并全部开启。
4. 在对话中描述任务即可自动使用，或在输入框输入 `/` 选择 Skill。

**description 长度限制**：Claude 帮助中心写明 description 上限为 200 字符（claude.com 开发者文档与 Agent Skills 规范为 1,024 字符）。本套件按较严格的 200 字符撰写，五个 description 均为 161–177 字符。

**替代方式：以 plugin 一次上传五个 Skill**（Pro 及以上方案）。Claude 的 plugin 需要 `.claude-plugin/plugin.json` 清单文件，本仓库未内置，可在打包时生成：

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

再到 **Customize > Plugins** 上传 `dist/senior-network-engineer-bundle.zip`。

### ChatGPT

**ChatGPT 桌面版**：与 Codex 共用本机 Skill，安装到 `~/.agents/skills` 即可（见下一节）。在 ChatGPT 中输入 `@` 选择 Skill。

**ChatGPT 网页版**：仅限 Business、Enterprise、Healthcare、Edu 方案，并受工作区管理设置控制。

1. 在侧边栏选择 **Plugins**。
2. 在 **Plugin Directory** 选择 **Skills** 标签页。
3. 选择 **Create** → **Upload from your computer**，逐一上传五个 Skill。ChatGPT 会先扫描，结果可能显示“Needs Review”或“Blocked”。

OpenAI 官方文档未说明上传的文件格式；可先尝试上一节的单一 Skill ZIP，若不被接受，再按上传界面的说明调整。

### OpenAI Codex（CLI、IDE extension）

```bash
DEST=~/.agents/skills        # 项目范围改用仓库内的 .agents/skills
```

- 使用通用命令复制或创建链接（官方文档明确支持链接）。
- Codex 会自动检测 Skill 变更；没有出现时重启 Codex。
- 调用：`$senior-network-engineer`，或执行 `/skills` 选择。
- 旧路径 `$CODEX_HOME/skills`（未设置 `CODEX_HOME` 时为 `~/.codex/skills`）已从官方文档移除，但 Codex 仍会以 deprecated 路径加载。若旧路径还有本套件的另一份文件，同名 Skill 会出现两次，请删除旧安装。

### Google Antigravity（2.0、IDE、CLI）

```bash
DEST=~/.gemini/config/skills                # Antigravity 2.0 与 IDE（全局）
DEST=~/.gemini/antigravity-cli/skills       # Antigravity CLI（全局）
DEST=<项目根目录>/.agents/skills            # 三者共用的项目范围
```

- 三种界面的全局路径不同；同时使用 2.0/IDE 与 CLI 时，两个全局路径都要安装，或改用项目范围的 `.agents/skills`。
- IDE 仍支持旧路径 `~/.gemini/antigravity/skills`。
- 从 Gemini CLI 迁移：`~/.gemini/skills` 对应 `~/.gemini/antigravity-cli/skills`；项目内的 `.gemini/skills` 需手动改名或移到 `.agents/skills`。
- CLI 也可用 plugin 安装：创建含 `plugin.json` 与 `skills/` 的文件夹后执行 `agy plugin install <plugin 文件夹>`；在 TUI 中输入 `/skills` 查看已加载的 Skill。

### Gemini CLI

Gemini CLI 自 2026-06-18 起停止为个人用户提供服务（改用 Antigravity CLI），目前仅 Gemini Code Assist Standard/Enterprise 授权与付费 Gemini API key 可继续使用。

```bash
DEST=~/.gemini/skills        # 或 ~/.agents/skills；项目范围用 .gemini/skills 或 .agents/skills
```

- 也可用官方命令创建链接：`gemini skills link ./skills`。
- 在 session 中执行 `/skills reload` 加载新 Skill，`/skills list` 查看列表。
- Skill 启用时才会开放其文件夹的文件访问；主 Skill 读取 subskill 时可能会出现授权提示。

### Cursor

```bash
DEST=~/.cursor/skills        # 或 ~/.agents/skills；项目范围用 .cursor/skills 或 .agents/skills
```

- Cursor 启动时自动发现 Skill；在 **Customize → Skills** 查看。
- 调用：在 Agent chat 输入 `/` 选择 Skill。
- 只有 `~/.cursor/skills` 会同步到 Cloud Agents（需在 **Settings → Agents** 开启 **Sync Skills for Cloud Agents**）；`~/.agents/skills` 不会同步到 Cloud Agents 或远程 SSH。

### GitHub Copilot（VS Code agent mode、Copilot CLI）

```bash
DEST=~/.copilot/skills       # 或 ~/.agents/skills；项目范围用 .github/skills 或 .agents/skills
```

- 通过组织或企业取得 Copilot 授权时，需管理员在策略中允许相关功能。
- VS Code：在 Chat 输入 `/skills` 打开 Skill 设置；Copilot CLI：`/skills list`、`/skills reload`。
- Copilot cloud agent 与 code review 在 GitHub 上执行，只会读取仓库内（项目范围）的 Skill。

### Hermes Agent

```bash
DEST=~/.hermes/skills/network   # 五个 Skill 放在同一个分类文件夹下
```

- 新 Skill 在新 session 生效（或执行 `/reset`）。
- 项目内的 `.hermes/skills`、`.agents/skills` 需先在该仓库执行 `hermes skills trust` 才会加载。
- 已安装在 `~/.agents/skills` 时，可在 `~/.hermes/config.yaml` 的 `skills.external_dirs` 加入该路径共用。
- 不建议用 `hermes skills install` 逐一从 GitHub 安装：它只复制 `SKILL.md` 直接引用的文件，跨 Skill 的 `../` 引用不会一并下载。

## 使用方式

直接描述任务，工具会按 description 自动选用 Skill；需要指定时，以各平台的方式手动调用（见快速对照表）。例如在 Codex：

```text
$senior-network-engineer 请分析这个跨厂商网络异常，先列出证据与假设，再提供可回滚的 MOP。请用简体中文回答。
```

单一厂商问题可直接调用 subskill，例如 `palo-alto-architect`、`fortinet-security-fabric-architect`、`cisco-network-dc-architect` 或 `hpe-aruba-network-architect`。

## 更新

在修改内容的电脑上：

```bash
git status --short
git add -- <实际修改的文件>
git commit -m "<单一目的的说明>"
git push
```

在其他电脑上：

```bash
git pull --ff-only
```

- 以链接安装的工具：pull 后立即生效。
- 以复制安装的工具：pull 后重新执行复制命令。
- 以上传安装的平台（Claude、ChatGPT 网页版）：重新打包并上传有变更的 Skill。

## 时效性信息

- 版本、EoL/EoS、CVE、Recommended Release、PQC 支持与 AI 工具能力都以原厂或官方文档为准，并在正文中标注核查日期。
- 各 AI 工具的 Skill 路径与上传流程变动频繁，本文档依据 2026-09-27 的官方文档整理；若安装后未加载，请先查阅该工具的最新文档。
- 下列资料在核查时只能找到第三方或社区来源，官方页面需登录原厂支持门户，Skill 正文已标注“引用前重查”：
  - FortiNAC 9.4 EoS 与 FortiGate CNF End of Order 日期（Fortinet Product Life Cycle，需 FortiCare 账号）
  - AirWave 软件 EoS 与 2930F/2930M/5400R 停售状态（HPE Networking Support Portal）
- 更新时效性内容时，同步更新对应段落的核查日期与 `bundle-manifest.json` 的 `version`。

## 维护规则

- 只在 `skills/` 内修改 Skill 正本；不要直接修改安装位置的复制版本。
- 保持五个 Skill 同层；`SKILL.md` 保持精简且少于 500 行，细节放入一层深度的 `references/`。
- Frontmatter `name` 必须与文件夹名称一致；`description` 不超过 200 字符（配合 Claude 帮助中心的上传限制），并同时写明功能与触发时机。
- 不凭记忆声称 CVE、fixed release、EoL、PQC、CLI、license 或 AI 平台功能；以原厂或官方文档为准并写明核查日期。
- 不提交客户配置、PCAP、账号、密码、PSK、私钥、API token、license 或工单附件。
- 高风险建议必须包含证据、blast radius、停止条件、回滚与验证。
- `README.md`（繁体中文）为 README 正本；修改时请在同一个 commit 中同步更新所有 `README/README.<lang>.md` 翻译版。
