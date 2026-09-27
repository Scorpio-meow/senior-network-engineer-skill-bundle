# Senior Network Engineer Skill Bundle

[繁體中文](../README.md) | [English](README.en.md) | [简体中文](README.zh-CN.md) | [粵語](README.yue.md) | [日本語](README.ja.md) | [한국어](README.ko.md) | [Español](README.es.md) | **Português (Brasil)** | [Français](README.fr.md) | [Deutsch](README.de.md) | [Русский](README.ru.md) | [Tiếng Việt](README.vi.md) | [Bahasa Indonesia](README.id.md) | [ไทย](README.th.md) | [Türkçe](README.tr.md) | [العربية](README.ar.md)

Um pacote pessoal de skills para engenheiros de rede sênior: uma skill principal multifabricante e quatro subskills por fabricante, mantidas em um único repositório Git para que vários computadores e ferramentas de IA compartilhem uma única fonte da verdade.

As skills seguem o [formato aberto Agent Skills](https://agentskills.io/specification) (cada pasta contém `SKILL.md` e um `references/` opcional) e podem ser instaladas no Claude, ChatGPT/Codex, Google Antigravity, Gemini CLI, Cursor, GitHub Copilot e em outras ferramentas compatíveis com o formato.

O conteúdo sensível ao tempo (versões, EoL, CVEs, PQC, recursos e caminhos de instalação das ferramentas de IA) foi verificado em **2026-09-27**.

> **Nota sobre o idioma:** O conteúdo das skills está escrito em chinês tradicional e, por padrão, instrui a IA a responder em chinês tradicional com a terminologia de TI corporativa de Taiwan. Se você precisar de respostas em outro idioma, indique-o explicitamente na sua solicitação.

## Conteúdo

- [Skills incluídas](#skills-incluídas)
- [Estrutura de diretórios](#estrutura-de-diretórios)
- [Antes de instalar](#antes-de-instalar)
- [Comandos comuns de instalação](#comandos-comuns-de-instalação)
- [Instalação por plataforma](#instalação-por-plataforma)
- [Uso](#uso)
- [Atualização](#atualização)
- [Informações sensíveis ao tempo](#informações-sensíveis-ao-tempo)
- [Regras de manutenção](#regras-de-manutenção)

## Skills incluídas

| Skill | Escopo |
|---|---|
| `senior-network-engineer` | Skill principal. Arquitetura e troubleshooting multifabricante, análise de pacotes/sessions, HA/DR, governança de CVEs e versões, PQC, fundamentos de segurança CEH/CISSP, governança de AI Agent/MCP, comunicação com clientes e fabricantes, HLD/LLD/MOP/RCA e treinamento; encaminha as perguntas às subskills abaixo |
| `palo-alto-architect` | PAN-OS NGFW, Panorama, Strata Cloud Manager, Prisma SASE, Cortex (XDR/XSIAM/XSOAR/AgentiX/Cortex Cloud), CVEs e PQC |
| `fortinet-security-fabric-architect` | FortiGate/FortiOS, FortiManager, FortiAnalyzer, SD-WAN, ZTNA, migração de SSL VPN para IPsec, PSIRT e PQC/QKD |
| `cisco-network-dc-architect` | Catalyst, Nexus/Nexus Dashboard, ACI, VXLAN EVPN, Catalyst SD-WAN, WLC 9800/CW9800, ISE, Secure Firewall, PSIRT e PQC/MACsec |
| `hpe-aruba-network-architect` | AOS-8/AOS-10, Instant AOS-8, HPE Aruba Networking Central, ClearPass, AOS-CX/AOS-Switch, HPE Security Bulletins e PPK/PQC |

## Estrutura de diretórios

```text
.
├── README.md                             # Chinês tradicional (versão canônica)
├── README/                               # Traduções (15 idiomas)
│   └── README.<lang>.md
├── bundle-manifest.json                  # Nome do pacote, versão e lista de skills
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

## Antes de instalar

1. **Instale as cinco skills na mesma pasta.** A skill principal carrega as subskills pelo caminho relativo `../<subskill>/SKILL.md`, que só é resolvido quando as cinco pastas ficam lado a lado.
2. **Não renomeie as pastas.** A maioria das ferramentas exige que o nome da pasta corresponda ao `name` em `SKILL.md` e pode ignorar silenciosamente uma skill quando eles divergem.
3. **Em plataformas baseadas em upload (Claude web/desktop, ChatGPT web), faça o upload e habilite as cinco.** Nessas plataformas, cada skill é independente. A Central de Ajuda da Anthropic informa que as skills não podem referenciar outras skills explicitamente, mas o Claude combina automaticamente várias skills quando apropriado.
4. **Instale uma vez e compartilhe entre ferramentas.** `~/.agents/skills` é um local compartilhado entre ferramentas, lido pelo Codex/ChatGPT desktop, Cursor, GitHub Copilot e Gemini CLI; o Claude Code e o Antigravity precisam de diretórios próprios.

## Comandos comuns de instalação

Primeiro clone este repositório e depois execute os comandos a partir da raiz do repositório. Substitua `$dest` / `DEST` pelo caminho da sua plataforma, conforme a tabela da próxima seção.

**Windows (PowerShell)**

```powershell
git clone https://github.com/Scorpio-meow/senior-network-engineer-skill-bundle.git
Set-Location senior-network-engineer-skill-bundle

$dest = Join-Path $HOME '.agents/skills'      # Substitua conforme a plataforma
New-Item -ItemType Directory -Path $dest -Force | Out-Null

# Opção 1: Copiar (maior compatibilidade; copie novamente após cada atualização)
Copy-Item ./skills/* $dest -Recurse -Force

# Opção 2: Junctions (alterações no repositório entram em vigor imediatamente; apenas para ferramentas com suporte oficial a links)
Get-ChildItem ./skills -Directory | ForEach-Object {
    New-Item -ItemType Junction -Path (Join-Path $dest $_.Name) -Target $_.FullName
}
```

**macOS / Linux**

```bash
git clone https://github.com/Scorpio-meow/senior-network-engineer-skill-bundle.git
cd senior-network-engineer-skill-bundle

DEST=~/.agents/skills        # Substitua conforme a plataforma
mkdir -p "$DEST"

# Opção 1: Copiar
cp -R skills/* "$DEST/"

# Opção 2: Links simbólicos (apenas para ferramentas com suporte oficial a links)
for d in "$PWD"/skills/*/; do ln -s "${d%/}" "$DEST/"; done
```

A criação de links falha se já existir uma pasta com o mesmo nome no destino; faça backup ou remova a versão antiga por conta própria antes.

## Instalação por plataforma

### Referência rápida

| Plataforma | Caminho pessoal (global) | Caminho do projeto | Suporte a links | Invocação manual |
|---|---|---|---|---|
| Claude Code | `~/.claude/skills` | `.claude/skills` | Sim | `/senior-network-engineer` |
| Claude web/desktop | Upload de ZIP (veja abaixo) | — | — | Digite `/` e selecione |
| ChatGPT desktop, Codex CLI/IDE | `~/.agents/skills` | `.agents/skills` | Sim | ChatGPT: `@`; Codex: `$senior-network-engineer` ou `/skills` |
| ChatGPT web | Upload (veja abaixo) | — | — | Automática ou `@` |
| Antigravity 2.0 / IDE | `~/.gemini/config/skills` | `.agents/skills` | Não documentado | `/senior-network-engineer` |
| Antigravity CLI | `~/.gemini/antigravity-cli/skills` | `.agents/skills` | Não documentado | `/senior-network-engineer` |
| Gemini CLI | `~/.gemini/skills` ou `~/.agents/skills` | `.gemini/skills` ou `.agents/skills` | Sim | Automática (`/skills list` para visualizar) |
| Cursor | `~/.cursor/skills` ou `~/.agents/skills` | `.cursor/skills` ou `.agents/skills` | Não documentado | Digite `/` no chat do Agent |
| GitHub Copilot (VS Code, CLI) | `~/.copilot/skills` ou `~/.agents/skills` | `.github/skills` ou `.agents/skills` | Não documentado | `/senior-network-engineer` |
| Hermes Agent | `~/.hermes/skills/<categoria>` | `.hermes/skills` ou `.agents/skills` | Não documentado | `/senior-network-engineer` |

Todas as ferramentas também carregam uma skill automaticamente quando a descrição dela corresponde à tarefa. Para as ferramentas marcadas como "Não documentado", a documentação oficial não informa se há suporte a links; instale copiando os arquivos.

### Claude Code

```bash
DEST=~/.claude/skills        # Para escopo de projeto, use .claude/skills
```

- Copie ou crie links usando os comandos comuns (a documentação oficial suporta links explicitamente).
- As alterações entram em vigor automaticamente na session atual; se `~/.claude/skills` não existia na inicialização, execute `/reload-skills`.
- Digite `/skills` para ver as skills carregadas.
- `~/.claude/skills` se aplica apenas ao Claude Code local, não ao Cowork nem a sessions na nuvem.

### Claude (claude.ai web, desktop)

Disponível nos planos pagos (Pro, Max, Team, Enterprise).

1. Habilite a execução de código: **Settings > Capabilities > Code execution and file creation**. No Team/Enterprise, um Owner precisa habilitar Skills e a execução de código em **Organization settings > Plugins & skills**.
2. Empacote cada uma das cinco skills em um ZIP próprio. O nível superior dentro do ZIP deve ser a própria pasta da skill (por exemplo, `palo-alto-architect/SKILL.md`); não coloque `SKILL.md` diretamente na raiz do ZIP.

   ```bash
   mkdir -p dist && cd skills
   for s in */; do zip -r "../dist/${s%/}.zip" "${s%/}"; done
   cd .. && unzip -l dist/senior-network-engineer.zip   # Toda entrada deve começar com senior-network-engineer/
   ```

   ```powershell
   # No Windows, use o PowerShell 7 (pwsh); o Compress-Archive do Windows PowerShell 5.1 pode gerar formatos de caminho incompatíveis
   New-Item -ItemType Directory -Path dist -Force | Out-Null
   Get-ChildItem ./skills -Directory | ForEach-Object {
       Compress-Archive -Path $_.FullName -DestinationPath "dist/$($_.Name).zip" -Force
   }
   ```

3. Acesse **Customize > Skills**, escolha **+** → **Create skill** → **Upload a skill**, faça o upload dos cinco ZIPs um a um e habilite todos.
4. Descreva sua tarefa em uma conversa para usá-las automaticamente, ou digite `/` na caixa de entrada para selecionar uma skill.

**Limite de tamanho da descrição:** A Central de Ajuda do Claude estabelece um limite de 200 caracteres para descrições (a documentação para desenvolvedores em claude.com e a especificação Agent Skills permitem 1.024 caracteres). Este pacote segue o limite mais restritivo de 200 caracteres; as cinco descrições têm entre 161 e 177 caracteres cada.

**Alternativa: fazer o upload das cinco skills de uma só vez como plugin** (plano Pro ou superior). Plugins do Claude exigem um manifesto `.claude-plugin/plugin.json`, que este repositório não inclui; gere-o durante o empacotamento:

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

Em seguida, faça o upload de `dist/senior-network-engineer-bundle.zip` em **Customize > Plugins**.

### ChatGPT

**ChatGPT desktop:** Compartilha as skills locais com o Codex; basta instalar em `~/.agents/skills` (veja a próxima seção). Digite `@` no ChatGPT para selecionar uma skill.

**ChatGPT web:** Restrito aos planos Business, Enterprise, Healthcare e Edu, e sujeito às configurações do administrador do workspace.

1. Escolha **Plugins** na barra lateral.
2. Em **Plugin Directory**, abra a aba **Skills**.
3. Escolha **Create** → **Upload from your computer** e faça o upload das cinco skills uma a uma. O ChatGPT analisa cada upload primeiro; o resultado pode exibir "Needs Review" ou "Blocked".

A documentação oficial da OpenAI não especifica o formato de arquivo para upload. Tente primeiro os ZIPs por skill da seção anterior; se não forem aceitos, ajuste conforme as instruções da tela de upload.

### OpenAI Codex (CLI, extensão de IDE)

```bash
DEST=~/.agents/skills        # Para escopo de projeto, use .agents/skills dentro do repositório
```

- Copie ou crie links usando os comandos comuns (a documentação oficial suporta links explicitamente).
- O Codex detecta alterações nas skills automaticamente; reinicie o Codex se elas não aparecerem.
- Invoque com `$senior-network-engineer` ou execute `/skills` para selecionar uma.
- O caminho antigo `$CODEX_HOME/skills` (`~/.codex/skills` quando `CODEX_HOME` não está definido) foi removido da documentação oficial, mas o Codex ainda o carrega como caminho obsoleto. Se restar outra cópia deste pacote ali, as skills com o mesmo nome aparecerão duplicadas; remova a instalação antiga.

### Google Antigravity (2.0, IDE, CLI)

```bash
DEST=~/.gemini/config/skills                # Antigravity 2.0 e IDE (global)
DEST=~/.gemini/antigravity-cli/skills       # Antigravity CLI (global)
DEST=<raiz-do-projeto>/.agents/skills       # Escopo de projeto compartilhado pelas três
```

- As três interfaces usam caminhos globais diferentes. Se você usa tanto o 2.0/IDE quanto a CLI, instale nos dois caminhos globais ou use o `.agents/skills` com escopo de projeto.
- O IDE ainda suporta o caminho antigo `~/.gemini/antigravity/skills`.
- Migração a partir do Gemini CLI: `~/.gemini/skills` corresponde a `~/.gemini/antigravity-cli/skills`; o `.gemini/skills` de um projeto precisa ser renomeado ou movido manualmente para `.agents/skills`.
- A CLI também pode instalar via plugin: crie uma pasta contendo `plugin.json` e `skills/` e execute `agy plugin install <pasta-do-plugin>`; digite `/skills` na TUI para ver as skills carregadas.

### Gemini CLI

O Gemini CLI deixou de atender usuários individuais em 2026-06-18 (substituído pelo Antigravity CLI). Apenas licenças Gemini Code Assist Standard/Enterprise e chaves pagas da Gemini API podem continuar a usá-lo.

```bash
DEST=~/.gemini/skills        # Ou ~/.agents/skills; para escopo de projeto, use .gemini/skills ou .agents/skills
```

- Você também pode criar links com o comando oficial: `gemini skills link ./skills`.
- Execute `/skills reload` em uma session para carregar novas skills e `/skills list` para visualizá-las.
- O acesso aos arquivos da pasta de uma skill só é concedido quando a skill é ativada; pode aparecer uma solicitação de permissão quando a skill principal lê uma subskill.

### Cursor

```bash
DEST=~/.cursor/skills        # Ou ~/.agents/skills; para escopo de projeto, use .cursor/skills ou .agents/skills
```

- O Cursor descobre as skills automaticamente na inicialização; visualize-as em **Customize → Skills**.
- Invoque digitando `/` no chat do Agent e selecionando uma skill.
- Apenas `~/.cursor/skills` é sincronizado com os Cloud Agents (habilite **Sync Skills for Cloud Agents** em **Settings → Agents**); `~/.agents/skills` não é sincronizado com os Cloud Agents nem com SSH remoto.

### GitHub Copilot (modo agente do VS Code, Copilot CLI)

```bash
DEST=~/.copilot/skills       # Ou ~/.agents/skills; para escopo de projeto, use .github/skills ou .agents/skills
```

- Se a sua licença do Copilot for fornecida por uma organização ou empresa, um administrador precisa liberar os recursos correspondentes na política.
- VS Code: digite `/skills` no Chat para abrir as configurações de skills. Copilot CLI: `/skills list`, `/skills reload`.
- O Copilot cloud agent e o code review são executados no GitHub e leem apenas as skills dentro do repositório (escopo de projeto).

### Hermes Agent

```bash
DEST=~/.hermes/skills/network   # Coloque as cinco skills na mesma pasta de categoria
```

- Novas skills entram em vigor em uma nova session (ou execute `/reset`).
- O `.hermes/skills` e o `.agents/skills` de um projeto só são carregados depois que você executa `hermes skills trust` nesse repositório.
- Se as skills já estiverem instaladas em `~/.agents/skills`, adicione esse caminho a `skills.external_dirs` em `~/.hermes/config.yaml` para compartilhá-las.
- Não é recomendado instalar uma a uma a partir do GitHub com `hermes skills install`: esse comando copia apenas os arquivos referenciados diretamente por `SKILL.md`, portanto as referências `../` entre skills não são baixadas.

## Uso

Descreva sua tarefa e a ferramenta seleciona as skills automaticamente com base nas descrições. Para escolher uma explicitamente, invoque-a da forma suportada pela sua plataforma (veja a tabela de referência rápida). Por exemplo, no Codex:

```text
$senior-network-engineer Analise este incidente de rede multifabricante. Liste primeiro as evidências e as hipóteses e, em seguida, forneça um MOP com plano de rollback. Por favor, responda em português do Brasil.
```

Para perguntas sobre um único fabricante, você pode invocar uma subskill diretamente, como `palo-alto-architect`, `fortinet-security-fabric-architect`, `cisco-network-dc-architect` ou `hpe-aruba-network-architect`.

## Atualização

No computador em que você fez as alterações:

```bash
git status --short
git add -- <arquivos-que-voce-realmente-alterou>
git commit -m "<descricao-de-proposito-unico>"
git push
```

Nos outros computadores:

```bash
git pull --ff-only
```

- Ferramentas instaladas via links: as alterações entram em vigor logo após o pull.
- Ferramentas instaladas por cópia: execute novamente o comando de cópia após o pull.
- Plataformas baseadas em upload (Claude, ChatGPT web): reempacote e faça novamente o upload das skills alteradas.

## Informações sensíveis ao tempo

- Versões, EoL/EoS, CVEs, Recommended Releases, suporte a PQC e recursos das ferramentas de IA baseiam-se na documentação do fabricante ou oficial, com a data de verificação indicada no texto.
- Os caminhos de skills e os fluxos de upload das ferramentas de IA mudam com frequência. Este documento reflete a documentação oficial em 2026-09-27; se uma skill não carregar após a instalação, consulte primeiro a documentação mais recente da ferramenta.
- No momento da verificação, os itens a seguir só puderam ser encontrados em fontes de terceiros ou da comunidade, pois as páginas oficiais exigem login no portal de suporte do fabricante. O conteúdo das skills os marca como "verificar novamente antes de citar":
  - Datas de EoS do FortiNAC 9.4 e de End of Order do FortiGate CNF (Fortinet Product Life Cycle, requer uma conta FortiCare)
  - EoS do software AirWave e status de fim de venda dos 2930F/2930M/5400R (HPE Networking Support Portal)
- Ao atualizar conteúdo sensível ao tempo, atualize também a data de verificação na seção correspondente e a `version` em `bundle-manifest.json`.

## Regras de manutenção

- Edite as skills canônicas somente dentro de `skills/`; não edite as cópias nos locais de instalação.
- Mantenha as cinco skills no mesmo nível; mantenha o `SKILL.md` conciso e com menos de 500 linhas, com os detalhes em `references/` de um único nível de profundidade.
- O `name` do frontmatter deve corresponder ao nome da pasta; a `description` deve ter no máximo 200 caracteres (para atender ao limite de upload da Central de Ajuda do Claude) e informar tanto o que a skill faz quanto quando acioná-la.
- Não afirme CVEs, fixed releases, EoL, PQC, CLI, licenciamento ou recursos de plataformas de IA de memória; baseie-se na documentação do fabricante ou oficial e registre a data de verificação.
- Não faça commit de configurações de clientes, PCAPs, contas, senhas, PSKs, chaves privadas, tokens de API, licenças ou anexos de chamados.
- Recomendações de alto risco devem incluir evidências, blast radius, condições de parada, rollback e validação.
- `README.md` (chinês tradicional) é o README canônico. Ao alterá-lo, atualize todas as traduções `README/README.<lang>.md` no mesmo commit.
