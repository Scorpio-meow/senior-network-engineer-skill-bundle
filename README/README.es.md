# Senior Network Engineer Skill Bundle

[繁體中文](../README.md) | [English](README.en.md) | [简体中文](README.zh-CN.md) | [粵語](README.yue.md) | [日本語](README.ja.md) | [한국어](README.ko.md) | **Español** | [Português (Brasil)](README.pt-BR.md) | [Français](README.fr.md) | [Deutsch](README.de.md) | [Русский](README.ru.md) | [Tiếng Việt](README.vi.md) | [Bahasa Indonesia](README.id.md) | [ไทย](README.th.md) | [Türkçe](README.tr.md) | [العربية](README.ar.md)

Un bundle personal de skills para ingenieros de redes senior: una skill principal multifabricante más cuatro subskills por fabricante, mantenidas en un único repositorio Git para que varios equipos y herramientas de IA compartan una sola fuente de verdad.

Las skills siguen el [formato abierto Agent Skills](https://agentskills.io/specification) (cada carpeta contiene `SKILL.md` y un directorio `references/` opcional) y pueden instalarse en Claude, ChatGPT/Codex, Google Antigravity, Gemini CLI, Cursor, GitHub Copilot y otras herramientas compatibles con el formato.

El contenido sujeto a cambios en el tiempo (versiones, EoL, CVE, PQC, capacidades de las herramientas de IA y rutas de instalación) se verificó a fecha de **2026-09-27**.

> **Nota sobre el idioma:** El contenido de las skills está escrito en chino tradicional e indica a la IA que responda de forma predeterminada en chino tradicional, con la terminología de TI empresarial de Taiwán. Si necesita respuestas en español u otro idioma, indíquelo explícitamente en su solicitud.

## Contenido

- [Skills incluidas](#skills-incluidas)
- [Estructura de directorios](#estructura-de-directorios)
- [Antes de instalar](#antes-de-instalar)
- [Comandos de instalación comunes](#comandos-de-instalación-comunes)
- [Instalación por plataforma](#instalación-por-plataforma)
- [Uso](#uso)
- [Actualización](#actualización)
- [Información con vigencia limitada](#información-con-vigencia-limitada)
- [Reglas de mantenimiento](#reglas-de-mantenimiento)

## Skills incluidas

| Skill | Alcance |
|---|---|
| `senior-network-engineer` | Skill principal. Arquitectura y troubleshooting multifabricante, análisis de paquetes/session, HA/DR, gobierno de CVE y versiones, PQC, fundamentos de seguridad CEH/CISSP, gobierno de AI Agent/MCP, comunicación con clientes y fabricantes, HLD/LLD/MOP/RCA y capacitación; enruta las consultas a las subskills siguientes |
| `palo-alto-architect` | PAN-OS NGFW, Panorama, Strata Cloud Manager, Prisma SASE, Cortex (XDR/XSIAM/XSOAR/AgentiX/Cortex Cloud), CVE y PQC |
| `fortinet-security-fabric-architect` | FortiGate/FortiOS, FortiManager, FortiAnalyzer, SD-WAN, ZTNA, migración de SSL VPN a IPsec, PSIRT y PQC/QKD |
| `cisco-network-dc-architect` | Catalyst, Nexus/Nexus Dashboard, ACI, VXLAN EVPN, Catalyst SD-WAN, WLC 9800/CW9800, ISE, Secure Firewall, PSIRT y PQC/MACsec |
| `hpe-aruba-network-architect` | AOS-8/AOS-10, Instant AOS-8, HPE Aruba Networking Central, ClearPass, AOS-CX/AOS-Switch, HPE Security Bulletins y PPK/PQC |

## Estructura de directorios

```text
.
├── README.md                             # Chino tradicional (canónico)
├── README/                               # Traducciones (15 idiomas)
│   └── README.<lang>.md
├── bundle-manifest.json                  # Nombre del bundle, versión y lista de skills
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

1. **Instale las cinco skills en la misma carpeta.** La skill principal carga las subskills mediante la ruta relativa `../<subskill>/SKILL.md`, que solo se resuelve cuando las cinco carpetas están al mismo nivel.
2. **No cambie el nombre de las carpetas.** La mayoría de las herramientas exigen que el nombre de la carpeta coincida con el `name` de `SKILL.md` y pueden omitir una skill sin aviso cuando no coinciden.
3. **En las plataformas basadas en carga de archivos (Claude web/escritorio, ChatGPT web), suba y habilite las cinco.** En estas plataformas cada skill es independiente. El Centro de ayuda de Anthropic indica que las skills no pueden hacer referencia explícita a otras skills, pero Claude combina automáticamente varias skills cuando corresponde.
4. **Instale una vez y comparta entre herramientas.** `~/.agents/skills` es una ubicación común que leen Codex/ChatGPT para escritorio, Cursor, GitHub Copilot y Gemini CLI; Claude Code y Antigravity necesitan sus propios directorios.

## Comandos de instalación comunes

Primero clone este repositorio y luego ejecute los comandos desde la raíz del repositorio. Reemplace `$dest` / `DEST` por la ruta de su plataforma según la tabla de la sección siguiente.

**Windows (PowerShell)**

```powershell
git clone https://github.com/Scorpio-meow/senior-network-engineer-skill-bundle.git
Set-Location senior-network-engineer-skill-bundle

$dest = Join-Path $HOME '.agents/skills'      # Reemplazar según la plataforma
New-Item -ItemType Directory -Path $dest -Force | Out-Null

# Opción 1: Copiar (máxima compatibilidad; volver a copiar tras cada actualización)
Copy-Item ./skills/* $dest -Recurse -Force

# Opción 2: Junctions (los cambios en el repositorio se aplican de inmediato; solo para herramientas que admiten enlaces oficialmente)
Get-ChildItem ./skills -Directory | ForEach-Object {
    New-Item -ItemType Junction -Path (Join-Path $dest $_.Name) -Target $_.FullName
}
```

**macOS / Linux**

```bash
git clone https://github.com/Scorpio-meow/senior-network-engineer-skill-bundle.git
cd senior-network-engineer-skill-bundle

DEST=~/.agents/skills        # Reemplazar según la plataforma
mkdir -p "$DEST"

# Opción 1: Copiar
cp -R skills/* "$DEST/"

# Opción 2: Enlaces simbólicos (solo para herramientas que admiten enlaces oficialmente)
for d in "$PWD"/skills/*/; do ln -s "${d%/}" "$DEST/"; done
```

La creación de enlaces falla si ya existe una carpeta con el mismo nombre en el destino; haga primero una copia de seguridad de la versión anterior o elimínela usted mismo.

## Instalación por plataforma

### Referencia rápida

| Plataforma | Ruta personal (global) | Ruta de proyecto | Admite enlaces | Invocación manual |
|---|---|---|---|---|
| Claude Code | `~/.claude/skills` | `.claude/skills` | Sí | `/senior-network-engineer` |
| Claude web/escritorio | Subir ZIP (ver más abajo) | — | — | Escribir `/` y elegir |
| ChatGPT para escritorio, Codex CLI/IDE | `~/.agents/skills` | `.agents/skills` | Sí | ChatGPT: `@`; Codex: `$senior-network-engineer` o `/skills` |
| ChatGPT web | Subir (ver más abajo) | — | — | Automática o `@` |
| Antigravity 2.0 / IDE | `~/.gemini/config/skills` | `.agents/skills` | No documentado | `/senior-network-engineer` |
| Antigravity CLI | `~/.gemini/antigravity-cli/skills` | `.agents/skills` | No documentado | `/senior-network-engineer` |
| Gemini CLI | `~/.gemini/skills` o `~/.agents/skills` | `.gemini/skills` o `.agents/skills` | Sí | Automática (`/skills list` para verlas) |
| Cursor | `~/.cursor/skills` o `~/.agents/skills` | `.cursor/skills` o `.agents/skills` | No documentado | Escribir `/` en el chat de Agent |
| GitHub Copilot (VS Code, CLI) | `~/.copilot/skills` o `~/.agents/skills` | `.github/skills` o `.agents/skills` | No documentado | `/senior-network-engineer` |
| Hermes Agent | `~/.hermes/skills/<categoría>` | `.hermes/skills` o `.agents/skills` | No documentado | `/senior-network-engineer` |

Todas las herramientas cargan además una skill automáticamente cuando su descripción coincide con la tarea. Para las herramientas marcadas como "No documentado", la documentación oficial no indica si se admiten enlaces; instale mediante copia.

### Claude Code

```bash
DEST=~/.claude/skills        # Para el ámbito de proyecto, usar .claude/skills
```

- Copie o enlace con los comandos comunes (la documentación oficial admite explícitamente los enlaces).
- Los cambios se aplican automáticamente en la session actual; si `~/.claude/skills` no existía al iniciar, ejecute `/reload-skills`.
- Escriba `/skills` para ver las skills cargadas.
- `~/.claude/skills` solo se aplica a Claude Code local, no a Cowork ni a las sessions en la nube.

### Claude (claude.ai web, escritorio)

Disponible en los planes de pago (Pro, Max, Team, Enterprise).

1. Habilite la ejecución de código: **Settings > Capabilities > Code execution and file creation**. En Team/Enterprise, un Owner debe habilitar Skills y la ejecución de código en **Organization settings > Plugins & skills**.
2. Empaquete cada una de las cinco skills en su propio ZIP. El nivel superior dentro del ZIP debe ser la propia carpeta de la skill (por ejemplo, `palo-alto-architect/SKILL.md`); no coloque `SKILL.md` directamente en la raíz del ZIP.

   ```bash
   mkdir -p dist && cd skills
   for s in */; do zip -r "../dist/${s%/}.zip" "${s%/}"; done
   cd .. && unzip -l dist/senior-network-engineer.zip   # Cada entrada debe empezar por senior-network-engineer/
   ```

   ```powershell
   # En Windows, use PowerShell 7 (pwsh); Compress-Archive de Windows PowerShell 5.1 puede generar formatos de ruta incompatibles
   New-Item -ItemType Directory -Path dist -Force | Out-Null
   Get-ChildItem ./skills -Directory | ForEach-Object {
       Compress-Archive -Path $_.FullName -DestinationPath "dist/$($_.Name).zip" -Force
   }
   ```

3. Vaya a **Customize > Skills**, elija **+** → **Create skill** → **Upload a skill**, suba los cinco ZIP uno por uno y habilítelos todos.
4. Describa su tarea en una conversación para usarlas automáticamente, o escriba `/` en el cuadro de entrada para elegir una skill.

**Límite de longitud de la descripción:** El Centro de ayuda de Claude establece un límite de 200 caracteres para las descripciones (la documentación para desarrolladores de claude.com y la especificación de Agent Skills permiten 1.024 caracteres). Este bundle sigue el límite más estricto de 200 caracteres; las cinco descripciones tienen entre 161 y 177 caracteres cada una.

**Alternativa: subir las cinco skills a la vez como plugin** (plan Pro o superior). Los plugins de Claude requieren un manifiesto `.claude-plugin/plugin.json`, que este repositorio no incluye; genérelo al empaquetar:

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

Luego suba `dist/senior-network-engineer-bundle.zip` en **Customize > Plugins**.

### ChatGPT

**ChatGPT para escritorio:** Comparte las skills locales con Codex; basta con instalarlas en `~/.agents/skills` (consulte la sección siguiente). Escriba `@` en ChatGPT para elegir una skill.

**ChatGPT web:** Limitado a los planes Business, Enterprise, Healthcare y Edu, y sujeto a la configuración del administrador del workspace.

1. Elija **Plugins** en la barra lateral.
2. En **Plugin Directory**, abra la pestaña **Skills**.
3. Elija **Create** → **Upload from your computer** y suba las cinco skills una por una. ChatGPT analiza primero cada carga; el resultado puede mostrar "Needs Review" o "Blocked".

La documentación oficial de OpenAI no especifica el formato de archivo de carga. Pruebe primero con los ZIP por skill de la sección anterior; si no se aceptan, ajústelos según las instrucciones de la pantalla de carga.

### OpenAI Codex (CLI, extensión de IDE)

```bash
DEST=~/.agents/skills        # Para el ámbito de proyecto, usar .agents/skills dentro del repositorio
```

- Copie o enlace con los comandos comunes (la documentación oficial admite explícitamente los enlaces).
- Codex detecta automáticamente los cambios en las skills; reinicie Codex si no aparecen.
- Invóquela con `$senior-network-engineer`, o ejecute `/skills` para elegir una.
- La ruta antigua `$CODEX_HOME/skills` (`~/.codex/skills` cuando `CODEX_HOME` no está definida) se eliminó de la documentación oficial, pero Codex todavía la carga como ruta obsoleta. Si queda allí otra copia de este bundle, las skills con el mismo nombre aparecen dos veces; elimine la instalación antigua.

### Google Antigravity (2.0, IDE, CLI)

```bash
DEST=~/.gemini/config/skills                # Antigravity 2.0 e IDE (global)
DEST=~/.gemini/antigravity-cli/skills       # Antigravity CLI (global)
DEST=<raíz-del-proyecto>/.agents/skills     # Ámbito de proyecto compartido por las tres
```

- Las tres interfaces usan rutas globales distintas. Si usa tanto 2.0/IDE como la CLI, instale en ambas rutas globales o utilice en su lugar `.agents/skills` con ámbito de proyecto.
- El IDE todavía admite la ruta antigua `~/.gemini/antigravity/skills`.
- Migración desde Gemini CLI: `~/.gemini/skills` corresponde a `~/.gemini/antigravity-cli/skills`; el directorio `.gemini/skills` de un proyecto debe renombrarse o moverse manualmente a `.agents/skills`.
- La CLI también puede instalar mediante plugin: cree una carpeta que contenga `plugin.json` y `skills/`, y luego ejecute `agy plugin install <carpeta-del-plugin>`; escriba `/skills` en la TUI para ver las skills cargadas.

### Gemini CLI

Gemini CLI dejó de prestar servicio a usuarios individuales el 2026-06-18 (reemplazado por Antigravity CLI). Solo pueden seguir usándolo las licencias de Gemini Code Assist Standard/Enterprise y las claves de pago de Gemini API.

```bash
DEST=~/.gemini/skills        # O ~/.agents/skills; para el ámbito de proyecto, usar .gemini/skills o .agents/skills
```

- También puede crear enlaces con el comando oficial: `gemini skills link ./skills`.
- Ejecute `/skills reload` en una session para cargar las skills nuevas y `/skills list` para verlas.
- El acceso a los archivos de la carpeta de una skill solo se concede cuando la skill está activada; es posible que vea una solicitud de permiso cuando la skill principal lee una subskill.

### Cursor

```bash
DEST=~/.cursor/skills        # O ~/.agents/skills; para el ámbito de proyecto, usar .cursor/skills o .agents/skills
```

- Cursor detecta las skills automáticamente al iniciar; puede verlas en **Customize → Skills**.
- Invóquelas escribiendo `/` en el chat de Agent y eligiendo una skill.
- Solo `~/.cursor/skills` se sincroniza con Cloud Agents (habilite **Sync Skills for Cloud Agents** en **Settings → Agents**); `~/.agents/skills` no se sincroniza con Cloud Agents ni con SSH remoto.

### GitHub Copilot (modo agente de VS Code, Copilot CLI)

```bash
DEST=~/.copilot/skills       # O ~/.agents/skills; para el ámbito de proyecto, usar .github/skills o .agents/skills
```

- Si su licencia de Copilot proviene de una organización o empresa, un administrador debe permitir las funciones correspondientes en las políticas.
- VS Code: escriba `/skills` en Chat para abrir la configuración de skills. Copilot CLI: `/skills list`, `/skills reload`.
- Copilot cloud agent y code review se ejecutan en GitHub y solo leen las skills dentro del repositorio (ámbito de proyecto).

### Hermes Agent

```bash
DEST=~/.hermes/skills/network   # Colocar las cinco skills en la misma carpeta de categoría
```

- Las skills nuevas se aplican en una session nueva (o ejecute `/reset`).
- Los directorios `.hermes/skills` y `.agents/skills` de un proyecto solo se cargan después de ejecutar `hermes skills trust` en ese repositorio.
- Si las skills ya están instaladas en `~/.agents/skills`, agregue esa ruta a `skills.external_dirs` en `~/.hermes/config.yaml` para compartirlas.
- No se recomienda instalarlas una por una desde GitHub con `hermes skills install`: solo copia los archivos referenciados directamente por `SKILL.md`, por lo que las referencias `../` entre skills no se descargan.

## Uso

Describa su tarea y la herramienta elegirá las skills automáticamente según sus descripciones. Para elegir una de forma explícita, invóquela de la manera que admita su plataforma (consulte la tabla de referencia rápida). Por ejemplo, en Codex:

```text
$senior-network-engineer Analiza este incidente de red multifabricante. Enumera primero la evidencia y las hipótesis y, a continuación, proporciona un MOP con un plan de rollback. Por favor, responde en español.
```

Para consultas de un solo fabricante puede invocar directamente una subskill, como `palo-alto-architect`, `fortinet-security-fabric-architect`, `cisco-network-dc-architect` o `hpe-aruba-network-architect`.

## Actualización

En el equipo donde realizó los cambios:

```bash
git status --short
git add -- <archivos-realmente-modificados>
git commit -m "<descripción de un solo propósito>"
git push
```

En los demás equipos:

```bash
git pull --ff-only
```

- Herramientas instaladas mediante enlaces: los cambios se aplican justo después del pull.
- Herramientas instaladas mediante copia: vuelva a ejecutar el comando de copia después del pull.
- Plataformas basadas en carga de archivos (Claude, ChatGPT web): vuelva a empaquetar y a subir las skills que cambiaron.

## Información con vigencia limitada

- Las versiones, EoL/EoS, CVE, Recommended Releases, compatibilidad con PQC y capacidades de las herramientas de IA se basan en la documentación del fabricante u oficial, con la fecha de verificación indicada en el texto.
- Las rutas de las skills y los flujos de carga de las herramientas de IA cambian con frecuencia. Este documento refleja la documentación oficial a fecha de 2026-09-27; si una skill no se carga tras la instalación, consulte primero la documentación más reciente de la herramienta.
- En el momento de la verificación, los siguientes elementos solo se encontraron en fuentes de terceros o de la comunidad, porque las páginas oficiales requieren iniciar sesión en un portal de soporte del fabricante. El contenido de las skills los marca como "volver a verificar antes de citar":
  - Fechas de EoS de FortiNAC 9.4 y de End of Order de FortiGate CNF (Fortinet Product Life Cycle, requiere una cuenta de FortiCare)
  - EoS del software AirWave y estado de fin de venta de 2930F/2930M/5400R (HPE Networking Support Portal)
- Al actualizar contenido con vigencia limitada, actualice también la fecha de verificación en la sección correspondiente y el `version` de `bundle-manifest.json`.

## Reglas de mantenimiento

- Edite las skills canónicas solo dentro de `skills/`; no edite las copias en las ubicaciones de instalación.
- Mantenga las cinco skills al mismo nivel; mantenga `SKILL.md` conciso y por debajo de 500 líneas, con los detalles en `references/` de un solo nivel de profundidad.
- El `name` del frontmatter debe coincidir con el nombre de la carpeta; `description` debe tener como máximo 200 caracteres (para ajustarse al límite de carga del Centro de ayuda de Claude) e indicar tanto qué hace la skill como cuándo debe activarse.
- No afirme CVE, fixed releases, EoL, PQC, CLI, licenciamiento ni funciones de plataformas de IA de memoria; básese en la documentación del fabricante u oficial y registre la fecha de verificación.
- No haga commit de configuraciones de clientes, PCAP, cuentas, contraseñas, PSK, claves privadas, API tokens, licencias ni adjuntos de tickets.
- Las recomendaciones de alto riesgo deben incluir evidencia, blast radius, condiciones de detención, rollback y validación.
- `README.md` (chino tradicional) es el README canónico. Al modificarlo, actualice todas las traducciones `README/README.<lang>.md` en el mismo commit.
