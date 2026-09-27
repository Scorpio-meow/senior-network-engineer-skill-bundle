# Senior Network Engineer Skill Bundle

[繁體中文](../README.md) | [English](README.en.md) | [简体中文](README.zh-CN.md) | [粵語](README.yue.md) | [日本語](README.ja.md) | [한국어](README.ko.md) | [Español](README.es.md) | [Português (Brasil)](README.pt-BR.md) | [Français](README.fr.md) | [Deutsch](README.de.md) | **Русский** | [Tiếng Việt](README.vi.md) | [Bahasa Indonesia](README.id.md) | [ไทย](README.th.md) | [Türkçe](README.tr.md) | [العربية](README.ar.md)

Персональный пакет навыков для ведущих сетевых инженеров: один мультивендорный основной навык и четыре вендорных subskill, хранящиеся в едином Git-репозитории, чтобы несколько компьютеров и AI-инструментов использовали один источник истины.

Навыки соответствуют [открытому формату Agent Skills](https://agentskills.io/specification) (каждая папка содержит `SKILL.md` и необязательный каталог `references/`) и могут быть установлены в Claude, ChatGPT/Codex, Google Antigravity, Gemini CLI, Cursor, GitHub Copilot и другие инструменты, поддерживающие этот формат.

Информация, зависящая от времени (версии, EoL, CVE, PQC, возможности AI-инструментов и пути установки), проверена по состоянию на **2026-09-27**.

> **Примечание о языке:** содержимое навыков написано на традиционном китайском языке и по умолчанию предписывает AI отвечать на традиционном китайском с использованием ИТ-терминологии, принятой в корпоративной среде Тайваня. Если вам нужны ответы на другом языке, явно укажите его в запросе.

## Содержание

- [Входящие в пакет навыки](#входящие-в-пакет-навыки)
- [Структура каталогов](#структура-каталогов)
- [Перед установкой](#перед-установкой)
- [Общие команды установки](#общие-команды-установки)
- [Установка по платформам](#установка-по-платформам)
- [Использование](#использование)
- [Обновление](#обновление)
- [Сведения с ограниченным сроком актуальности](#сведения-с-ограниченным-сроком-актуальности)
- [Правила сопровождения](#правила-сопровождения)

## Входящие в пакет навыки

| Навык | Область применения |
|---|---|
| `senior-network-engineer` | Основной навык. Мультивендорная архитектура и диагностика, анализ пакетов/session, HA/DR, управление CVE и версиями, PQC, основы безопасности CEH/CISSP, управление AI Agent/MCP, коммуникация с заказчиками и вендорами, HLD/LLD/MOP/RCA и обучение; маршрутизирует вопросы к subskill, перечисленным ниже |
| `palo-alto-architect` | PAN-OS NGFW, Panorama, Strata Cloud Manager, Prisma SASE, Cortex (XDR/XSIAM/XSOAR/AgentiX/Cortex Cloud), CVE и PQC |
| `fortinet-security-fabric-architect` | FortiGate/FortiOS, FortiManager, FortiAnalyzer, SD-WAN, ZTNA, миграция с SSL VPN на IPsec, PSIRT и PQC/QKD |
| `cisco-network-dc-architect` | Catalyst, Nexus/Nexus Dashboard, ACI, VXLAN EVPN, Catalyst SD-WAN, 9800/CW9800 WLC, ISE, Secure Firewall, PSIRT и PQC/MACsec |
| `hpe-aruba-network-architect` | AOS-8/AOS-10, Instant AOS-8, HPE Aruba Networking Central, ClearPass, AOS-CX/AOS-Switch, HPE Security Bulletins и PPK/PQC |

## Структура каталогов

```text
.
├── README.md                             # Традиционный китайский (канонический)
├── README/                               # Переводы (15 языков)
│   └── README.<lang>.md
├── bundle-manifest.json                  # Название пакета, версия и список навыков
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

## Перед установкой

1. **Устанавливайте все пять навыков в одну и ту же папку.** Основной навык загружает subskill по относительному пути `../<subskill>/SKILL.md`, который разрешается только в том случае, если все пять папок находятся рядом.
2. **Не переименовывайте папки.** Большинство инструментов требуют, чтобы имя папки совпадало с `name` в `SKILL.md`, и при расхождении могут молча пропустить навык.
3. **На платформах с загрузкой (Claude web/desktop, ChatGPT web) загрузите и включите все пять навыков.** На этих платформах каждый навык независим. В Anthropic Help Center указано, что навыки не могут явно ссылаться на другие навыки, однако Claude при необходимости автоматически комбинирует несколько навыков.
4. **Установите один раз — используйте во всех инструментах.** `~/.agents/skills` — общий для инструментов каталог, который читают Codex/ChatGPT desktop, Cursor, GitHub Copilot и Gemini CLI; для Claude Code и Antigravity нужны собственные каталоги.

## Общие команды установки

Сначала клонируйте этот репозиторий, затем выполняйте команды из его корня. Замените `$dest` / `DEST` на путь для вашей платформы из таблицы в следующем разделе.

**Windows (PowerShell)**

```powershell
git clone https://github.com/Scorpio-meow/senior-network-engineer-skill-bundle.git
Set-Location senior-network-engineer-skill-bundle

$dest = Join-Path $HOME '.agents/skills'      # Замените для своей платформы
New-Item -ItemType Directory -Path $dest -Force | Out-Null

# Вариант 1: копирование (максимальная совместимость; после каждого обновления копируйте заново)
Copy-Item ./skills/* $dest -Recurse -Force

# Вариант 2: Junction (изменения в репозитории применяются сразу; только для инструментов с официальной поддержкой ссылок)
Get-ChildItem ./skills -Directory | ForEach-Object {
    New-Item -ItemType Junction -Path (Join-Path $dest $_.Name) -Target $_.FullName
}
```

**macOS / Linux**

```bash
git clone https://github.com/Scorpio-meow/senior-network-engineer-skill-bundle.git
cd senior-network-engineer-skill-bundle

DEST=~/.agents/skills        # Замените для своей платформы
mkdir -p "$DEST"

# Вариант 1: копирование
cp -R skills/* "$DEST/"

# Вариант 2: символические ссылки (только для инструментов с официальной поддержкой ссылок)
for d in "$PWD"/skills/*/; do ln -s "${d%/}" "$DEST/"; done
```

Создание ссылок завершится ошибкой, если в целевом каталоге уже есть папка с тем же именем; предварительно сделайте резервную копию или удалите старую версию самостоятельно.

## Установка по платформам

### Краткая справка

| Платформа | Персональный (глобальный) путь | Путь проекта | Поддержка ссылок | Ручной вызов |
|---|---|---|---|---|
| Claude Code | `~/.claude/skills` | `.claude/skills` | Да | `/senior-network-engineer` |
| Claude web/desktop | Загрузка ZIP (см. ниже) | — | — | Введите `/` и выберите |
| ChatGPT desktop, Codex CLI/IDE | `~/.agents/skills` | `.agents/skills` | Да | ChatGPT: `@`; Codex: `$senior-network-engineer` или `/skills` |
| ChatGPT web | Загрузка (см. ниже) | — | — | Автоматически или `@` |
| Antigravity 2.0 / IDE | `~/.gemini/config/skills` | `.agents/skills` | Не задокументировано | `/senior-network-engineer` |
| Antigravity CLI | `~/.gemini/antigravity-cli/skills` | `.agents/skills` | Не задокументировано | `/senior-network-engineer` |
| Gemini CLI | `~/.gemini/skills` или `~/.agents/skills` | `.gemini/skills` или `.agents/skills` | Да | Автоматически (`/skills list` для просмотра) |
| Cursor | `~/.cursor/skills` или `~/.agents/skills` | `.cursor/skills` или `.agents/skills` | Не задокументировано | Введите `/` в Agent chat |
| GitHub Copilot (VS Code, CLI) | `~/.copilot/skills` или `~/.agents/skills` | `.github/skills` или `.agents/skills` | Не задокументировано | `/senior-network-engineer` |
| Hermes Agent | `~/.hermes/skills/<категория>` | `.hermes/skills` или `.agents/skills` | Не задокументировано | `/senior-network-engineer` |

Каждый инструмент также автоматически загружает навык, если его описание соответствует задаче. Для инструментов с пометкой «Не задокументировано» официальная документация не указывает, поддерживаются ли ссылки; устанавливайте их копированием.

### Claude Code

```bash
DEST=~/.claude/skills        # Для области проекта используйте .claude/skills
```

- Скопируйте или создайте ссылки с помощью общих команд (ссылки явно поддерживаются согласно официальной документации).
- Изменения применяются автоматически в текущей session; если `~/.claude/skills` не существовал на момент запуска, выполните `/reload-skills`.
- Введите `/skills`, чтобы просмотреть загруженные навыки.
- `~/.claude/skills` действует только для локального Claude Code, но не для Cowork или облачных session.

### Claude (claude.ai web, desktop)

Доступно на платных тарифах (Pro, Max, Team, Enterprise).

1. Включите выполнение кода: **Settings > Capabilities > Code execution and file creation**. На тарифах Team/Enterprise Owner должен включить Skills и выполнение кода в **Organization settings > Plugins & skills**.
2. Упакуйте каждый из пяти навыков в отдельный ZIP. Верхним уровнем внутри ZIP должна быть сама папка навыка (например, `palo-alto-architect/SKILL.md`); не размещайте `SKILL.md` непосредственно в корне ZIP.

   ```bash
   mkdir -p dist && cd skills
   for s in */; do zip -r "../dist/${s%/}.zip" "${s%/}"; done
   cd .. && unzip -l dist/senior-network-engineer.zip   # Каждая запись должна начинаться с senior-network-engineer/
   ```

   ```powershell
   # В Windows используйте PowerShell 7 (pwsh); Compress-Archive в Windows PowerShell 5.1 может создавать несовместимый формат путей
   New-Item -ItemType Directory -Path dist -Force | Out-Null
   Get-ChildItem ./skills -Directory | ForEach-Object {
       Compress-Archive -Path $_.FullName -DestinationPath "dist/$($_.Name).zip" -Force
   }
   ```

3. Перейдите в **Customize > Skills**, выберите **+** → **Create skill** → **Upload a skill**, загрузите пять ZIP по одному и включите все навыки.
4. Опишите задачу в диалоге, чтобы навыки применились автоматически, или введите `/` в поле ввода, чтобы выбрать навык.

**Ограничение длины описания:** в Claude Help Center указан лимит в 200 символов для описаний (документация для разработчиков на claude.com и спецификация Agent Skills допускают 1 024 символа). Этот пакет придерживается более строгого лимита в 200 символов; длина каждого из пяти описаний — 161–177 символов.

**Альтернатива: загрузить все пять навыков сразу как плагин** (тариф Pro или выше). Плагинам Claude требуется манифест `.claude-plugin/plugin.json`, которого нет в этом репозитории; сгенерируйте его при упаковке:

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

Затем загрузите `dist/senior-network-engineer-bundle.zip` в **Customize > Plugins**.

### ChatGPT

**ChatGPT desktop:** использует локальные навыки совместно с Codex; достаточно установить их в `~/.agents/skills` (см. следующий раздел). Введите `@` в ChatGPT, чтобы выбрать навык.

**ChatGPT web:** доступно только на тарифах Business, Enterprise, Healthcare и Edu и зависит от настроек администратора рабочей области.

1. Выберите **Plugins** на боковой панели.
2. В **Plugin Directory** откройте вкладку **Skills**.
3. Выберите **Create** → **Upload from your computer** и загрузите пять навыков по одному. ChatGPT предварительно сканирует каждую загрузку; результатом может быть "Needs Review" или "Blocked".

Официальная документация OpenAI не определяет формат загружаемого файла. Сначала попробуйте ZIP-архивы отдельных навыков из предыдущего раздела; если они не принимаются, действуйте согласно инструкциям на экране загрузки.

### OpenAI Codex (CLI, расширение IDE)

```bash
DEST=~/.agents/skills        # Для области проекта используйте .agents/skills внутри репозитория
```

- Скопируйте или создайте ссылки с помощью общих команд (ссылки явно поддерживаются согласно официальной документации).
- Codex автоматически обнаруживает изменения навыков; если они не появились, перезапустите Codex.
- Вызывайте через `$senior-network-engineer` или выполните `/skills`, чтобы выбрать навык.
- Старый путь `$CODEX_HOME/skills` (`~/.codex/skills`, если `CODEX_HOME` не задан) удалён из официальной документации, но Codex по-прежнему загружает его как устаревший путь. Если там осталась другая копия этого пакета, навыки с одинаковыми именами появятся дважды; удалите старую установку.

### Google Antigravity (2.0, IDE, CLI)

```bash
DEST=~/.gemini/config/skills                # Antigravity 2.0 и IDE (глобально)
DEST=~/.gemini/antigravity-cli/skills       # Antigravity CLI (глобально)
DEST=<корень-проекта>/.agents/skills        # Область проекта, общая для всех трёх
```

- Три интерфейса используют разные глобальные пути. Если вы работаете и с 2.0/IDE, и с CLI, установите навыки по обоим глобальным путям либо используйте вместо этого `.agents/skills` в области проекта.
- IDE по-прежнему поддерживает старый путь `~/.gemini/antigravity/skills`.
- Миграция с Gemini CLI: `~/.gemini/skills` соответствует `~/.gemini/antigravity-cli/skills`; каталог `.gemini/skills` проекта необходимо вручную переименовать или переместить в `.agents/skills`.
- CLI также поддерживает установку через плагин: создайте папку с `plugin.json` и `skills/`, затем выполните `agy plugin install <папка-плагина>`; введите `/skills` в TUI, чтобы просмотреть загруженные навыки.

### Gemini CLI

Gemini CLI прекратил обслуживание индивидуальных пользователей 2026-06-18 (заменён Antigravity CLI). Продолжать использовать его могут только обладатели лицензий Gemini Code Assist Standard/Enterprise и платных ключей Gemini API.

```bash
DEST=~/.gemini/skills        # Или ~/.agents/skills; для области проекта используйте .gemini/skills или .agents/skills
```

- Ссылки также можно создать официальной командой: `gemini skills link ./skills`.
- Выполните `/skills reload` в session, чтобы загрузить новые навыки, и `/skills list`, чтобы просмотреть их.
- Доступ к файлам папки навыка предоставляется только при активации навыка; когда основной навык читает subskill, может появиться запрос разрешения.

### Cursor

```bash
DEST=~/.cursor/skills        # Или ~/.agents/skills; для области проекта используйте .cursor/skills или .agents/skills
```

- Cursor автоматически обнаруживает навыки при запуске; просмотреть их можно в **Customize → Skills**.
- Для вызова введите `/` в Agent chat и выберите навык.
- С Cloud Agents синхронизируется только `~/.cursor/skills` (включите **Sync Skills for Cloud Agents** в **Settings → Agents**); `~/.agents/skills` не синхронизируется ни с Cloud Agents, ни с удалённым SSH.

### GitHub Copilot (VS Code agent mode, Copilot CLI)

```bash
DEST=~/.copilot/skills       # Или ~/.agents/skills; для области проекта используйте .github/skills или .agents/skills
```

- Если лицензия Copilot предоставлена организацией или предприятием, администратор должен разрешить соответствующие функции в политике.
- VS Code: введите `/skills` в Chat, чтобы открыть настройки навыков. Copilot CLI: `/skills list`, `/skills reload`.
- Copilot cloud agent и code review работают на GitHub и читают только навыки внутри репозитория (область проекта).

### Hermes Agent

```bash
DEST=~/.hermes/skills/network   # Поместите все пять навыков в одну папку категории
```

- Новые навыки вступают в силу в новой session (или выполните `/reset`).
- Каталоги проекта `.hermes/skills` и `.agents/skills` загружаются только после выполнения `hermes skills trust` в этом репозитории.
- Если навыки уже установлены в `~/.agents/skills`, добавьте этот путь в `skills.external_dirs` в `~/.hermes/config.yaml`, чтобы использовать их совместно.
- Устанавливать навыки по одному из GitHub с помощью `hermes skills install` не рекомендуется: команда копирует только файлы, на которые напрямую ссылается `SKILL.md`, поэтому межнавыковые ссылки `../` не загружаются.

## Использование

Опишите задачу, и инструмент автоматически выберет навыки на основе их описаний. Чтобы выбрать навык явно, вызовите его способом, поддерживаемым вашей платформой (см. таблицу краткой справки). Например, в Codex:

```text
$senior-network-engineer Проанализируй этот мультивендорный сетевой инцидент. Сначала перечисли доказательства и гипотезы, затем предоставь MOP с планом отката. Пожалуйста, отвечай на русском языке.
```

Для вопросов, касающихся одного вендора, можно напрямую вызвать subskill, например `palo-alto-architect`, `fortinet-security-fabric-architect`, `cisco-network-dc-architect` или `hpe-aruba-network-architect`.

## Обновление

На компьютере, где были внесены изменения:

```bash
git status --short
git add -- <фактически-изменённые-файлы>
git commit -m "<описание с одной целью>"
git push
```

На других компьютерах:

```bash
git pull --ff-only
```

- Инструменты, установленные через ссылки: изменения вступают в силу сразу после pull.
- Инструменты, установленные копированием: после pull повторно выполните команду копирования.
- Платформы с загрузкой (Claude, ChatGPT web): заново упакуйте и загрузите изменённые навыки.

## Сведения с ограниченным сроком актуальности

- Версии, EoL/EoS, CVE, Recommended Releases, поддержка PQC и возможности AI-инструментов основаны на документации вендоров или официальных источников; дата проверки указана в тексте.
- Пути к навыкам и процедуры загрузки в AI-инструментах часто меняются. Этот документ отражает официальную документацию по состоянию на 2026-09-27; если навык не загружается после установки, в первую очередь сверьтесь с актуальной документацией инструмента.
- На момент проверки следующие сведения удалось найти только в сторонних или community-источниках, поскольку официальные страницы требуют входа на портал поддержки вендора. В содержимом навыков они помечены как «перепроверить перед цитированием»:
  - Даты EoS FortiNAC 9.4 и End of Order FortiGate CNF (Fortinet Product Life Cycle, требуется учётная запись FortiCare)
  - EoS программного обеспечения AirWave и статус окончания продаж 2930F/2930M/5400R (HPE Networking Support Portal)
- При обновлении информации, зависящей от времени, также обновите дату проверки в соответствующем разделе и `version` в `bundle-manifest.json`.

## Правила сопровождения

- Редактируйте канонические навыки только внутри `skills/`; не редактируйте копии в местах установки.
- Держите все пять навыков на одном уровне; `SKILL.md` должен быть лаконичным и не превышать 500 строк, а подробности — выноситься в `references/` глубиной в один уровень.
- `name` во frontmatter должно совпадать с именем папки; `description` должно содержать не более 200 символов (чтобы уложиться в лимит загрузки Claude Help Center) и указывать как назначение навыка, так и условия его срабатывания.
- Не утверждайте что-либо о CVE, fixed release, EoL, PQC, CLI, лицензировании или функциях AI-платформ по памяти; опирайтесь на документацию вендоров или официальные источники и фиксируйте дату проверки.
- Не коммитьте конфигурации заказчиков, PCAP, учётные записи, пароли, PSK, закрытые ключи, API-токены, лицензии или вложения заявок.
- Рекомендации с высоким риском должны включать доказательства, blast radius, условия остановки, откат и проверку.
- `README.md` (традиционный китайский) является каноническим README. При его изменении обновляйте все переводы `README/README.<lang>.md` в том же коммите.
