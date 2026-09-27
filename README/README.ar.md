# Senior Network Engineer Skill Bundle

[繁體中文](../README.md) | [English](README.en.md) | [简体中文](README.zh-CN.md) | [粵語](README.yue.md) | [日本語](README.ja.md) | [한국어](README.ko.md) | [Español](README.es.md) | [Português (Brasil)](README.pt-BR.md) | [Français](README.fr.md) | [Deutsch](README.de.md) | [Русский](README.ru.md) | [Tiếng Việt](README.vi.md) | [Bahasa Indonesia](README.id.md) | [ไทย](README.th.md) | [Türkçe](README.tr.md) | **العربية**

حزمة مهارات شخصية لمهندسي الشبكات الأقدم: مهارة رئيسية واحدة متعددة الموردين إضافةً إلى أربع subskill خاصة بالموردين، محفوظة في مستودع Git واحد بحيث تتشارك عدة أجهزة وأدوات ذكاء اصطناعي مصدرًا واحدًا موثوقًا.

تتبع المهارات [صيغة Agent Skills المفتوحة](https://agentskills.io/specification) (يحتوي كل مجلد على `SKILL.md` ومجلد `references/` اختياري)، ويمكن تثبيتها في Claude وChatGPT/Codex وGoogle Antigravity وGemini CLI وCursor وGitHub Copilot وغيرها من الأدوات التي تدعم هذه الصيغة.

تم التحقق من المحتوى الحساس للوقت (الإصدارات وEoL وCVE وPQC وقدرات أدوات الذكاء الاصطناعي ومسارات التثبيت) حتى تاريخ **2026-09-27**.

> **ملاحظة حول اللغة:** محتوى المهارات مكتوب باللغة الصينية التقليدية، ويوجّه الذكاء الاصطناعي افتراضيًا إلى الإجابة بالصينية التقليدية وباستخدام مصطلحات تقنية المعلومات المعتمدة في مؤسسات تايوان. إذا كنت بحاجة إلى إجابات بلغة أخرى، فاذكر ذلك صراحةً في طلبك.

## المحتويات

- [المهارات المضمنة](#المهارات-المضمنة)
- [بنية المجلدات](#بنية-المجلدات)
- [قبل التثبيت](#قبل-التثبيت)
- [أوامر التثبيت الشائعة](#أوامر-التثبيت-الشائعة)
- [التثبيت حسب المنصة](#التثبيت-حسب-المنصة)
- [الاستخدام](#الاستخدام)
- [التحديث](#التحديث)
- [المعلومات المرتبطة بالوقت](#المعلومات-المرتبطة-بالوقت)
- [قواعد الصيانة](#قواعد-الصيانة)

## المهارات المضمنة

| المهارة | النطاق |
|---|---|
| `senior-network-engineer` | المهارة الرئيسية. تصميم المعماريات واستكشاف الأخطاء وإصلاحها عبر الموردين المختلفين، وتحليل الحزم/session، وHA/DR، وحوكمة CVE والإصدارات، وPQC، وأسس الأمن وفق CEH/CISSP، وحوكمة AI Agent/MCP، والتواصل مع العملاء والموردين، وHLD/LLD/MOP/RCA والتدريب؛ وتوجّه الأسئلة إلى الـ subskill أدناه |
| `palo-alto-architect` | PAN-OS NGFW وPanorama وStrata Cloud Manager وPrisma SASE وCortex (XDR/XSIAM/XSOAR/AgentiX/Cortex Cloud) وCVE وPQC |
| `fortinet-security-fabric-architect` | FortiGate/FortiOS وFortiManager وFortiAnalyzer وSD-WAN وZTNA والترحيل من SSL VPN إلى IPsec وPSIRT وPQC/QKD |
| `cisco-network-dc-architect` | Catalyst وNexus/Nexus Dashboard وACI وVXLAN EVPN وCatalyst SD-WAN و9800/CW9800 WLC وISE وSecure Firewall وPSIRT وPQC/MACsec |
| `hpe-aruba-network-architect` | AOS-8/AOS-10 وInstant AOS-8 وHPE Aruba Networking Central وClearPass وAOS-CX/AOS-Switch وHPE Security Bulletins وPPK/PQC |

## بنية المجلدات

```text
.
├── README.md                             # الصينية التقليدية (النسخة المرجعية)
├── README/                               # الترجمات (15 لغة)
│   └── README.<lang>.md
├── bundle-manifest.json                  # اسم الحزمة والإصدار وقائمة المهارات
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

## قبل التثبيت

1. **ثبّت المهارات الخمس جميعها في المجلد نفسه.** تحمّل المهارة الرئيسية الـ subskill عبر المسار النسبي `../<subskill>/SKILL.md`، ولا يُحلّ هذا المسار إلا عندما تكون المجلدات الخمسة متجاورة في المستوى نفسه.
2. **لا تُعِد تسمية المجلدات.** تشترط معظم الأدوات أن يطابق اسم المجلد قيمة `name` في `SKILL.md`، وقد تتجاهل المهارة بصمت عند اختلافهما.
3. **على المنصات القائمة على الرفع (Claude للويب/سطح المكتب، وChatGPT للويب)، ارفع المهارات الخمس جميعها وفعّلها.** كل مهارة مستقلة على هذه المنصات. يذكر مركز مساعدة Anthropic أن المهارات لا يمكنها الإشارة صراحةً إلى مهارات أخرى، لكن Claude يجمع بين عدة مهارات تلقائيًا عند الحاجة.
4. **ثبّت مرة واحدة وشارك بين الأدوات.** يُعدّ `~/.agents/skills` موقعًا مشتركًا بين الأدوات تقرؤه تطبيقات Codex/ChatGPT لسطح المكتب وCursor وGitHub Copilot وGemini CLI؛ أما Claude Code وAntigravity فيحتاجان إلى مجلداتهما الخاصة.

## أوامر التثبيت الشائعة

انسخ هذا المستودع (clone) أولًا، ثم نفّذ الأوامر من جذر المستودع. استبدل `$dest` / `DEST` بمسار منصتك من الجدول في القسم التالي.

**Windows (PowerShell)**

```powershell
git clone https://github.com/Scorpio-meow/senior-network-engineer-skill-bundle.git
Set-Location senior-network-engineer-skill-bundle

$dest = Join-Path $HOME '.agents/skills'      # استبدله حسب المنصة
New-Item -ItemType Directory -Path $dest -Force | Out-Null

# الخيار 1: النسخ (أفضل توافق؛ أعد النسخ بعد كل تحديث)
Copy-Item ./skills/* $dest -Recurse -Force

# الخيار 2: Junctions (تسري تعديلات المستودع فورًا؛ فقط للأدوات التي تدعم الروابط رسميًا)
Get-ChildItem ./skills -Directory | ForEach-Object {
    New-Item -ItemType Junction -Path (Join-Path $dest $_.Name) -Target $_.FullName
}
```

**macOS / Linux**

```bash
git clone https://github.com/Scorpio-meow/senior-network-engineer-skill-bundle.git
cd senior-network-engineer-skill-bundle

DEST=~/.agents/skills        # استبدله حسب المنصة
mkdir -p "$DEST"

# الخيار 1: النسخ
cp -R skills/* "$DEST/"

# الخيار 2: الروابط الرمزية Symlinks (فقط للأدوات التي تدعم الروابط رسميًا)
for d in "$PWD"/skills/*/; do ln -s "${d%/}" "$DEST/"; done
```

يفشل إنشاء الروابط إذا كان هناك مجلد بالاسم نفسه موجود مسبقًا في الوجهة؛ لذا احتفظ بنسخة احتياطية من الإصدار القديم أو احذفه بنفسك أولًا.

## التثبيت حسب المنصة

### مرجع سريع

| المنصة | المسار الشخصي (العام) | مسار المشروع | دعم الروابط | الاستدعاء اليدوي |
|---|---|---|---|---|
| Claude Code | `~/.claude/skills` | `.claude/skills` | نعم | `/senior-network-engineer` |
| Claude للويب/سطح المكتب | رفع ملف ZIP (انظر أدناه) | — | — | اكتب `/` ثم اختر |
| ChatGPT لسطح المكتب، Codex CLI/IDE | `~/.agents/skills` | `.agents/skills` | نعم | ChatGPT: `@`؛ Codex: `$senior-network-engineer` أو `/skills` |
| ChatGPT للويب | الرفع (انظر أدناه) | — | — | تلقائي أو `@` |
| Antigravity 2.0 / IDE | `~/.gemini/config/skills` | `.agents/skills` | غير موثق | `/senior-network-engineer` |
| Antigravity CLI | `~/.gemini/antigravity-cli/skills` | `.agents/skills` | غير موثق | `/senior-network-engineer` |
| Gemini CLI | `~/.gemini/skills` أو `~/.agents/skills` | `.gemini/skills` أو `.agents/skills` | نعم | تلقائي (`/skills list` للعرض) |
| Cursor | `~/.cursor/skills` أو `~/.agents/skills` | `.cursor/skills` أو `.agents/skills` | غير موثق | اكتب `/` في Agent chat |
| GitHub Copilot (VS Code، CLI) | `~/.copilot/skills` أو `~/.agents/skills` | `.github/skills` أو `.agents/skills` | غير موثق | `/senior-network-engineer` |
| Hermes Agent | `~/.hermes/skills/<category>` | `.hermes/skills` أو `.agents/skills` | غير موثق | `/senior-network-engineer` |

تحمّل كل أداة المهارة تلقائيًا أيضًا عندما يطابق وصفها المهمة المطلوبة. بالنسبة إلى الأدوات المعلَّمة بـ"غير موثق"، لا تذكر الوثائق الرسمية ما إذا كانت الروابط مدعومة؛ لذا ثبّت عن طريق النسخ.

### Claude Code

```bash
DEST=~/.claude/skills        # لنطاق المشروع استخدم .claude/skills
```

- انسخ أو أنشئ روابط باستخدام الأوامر الشائعة (الروابط مدعومة صراحةً في الوثائق الرسمية).
- تسري التغييرات تلقائيًا في الـ session الحالية؛ وإذا لم يكن `~/.claude/skills` موجودًا عند بدء التشغيل، فنفّذ `/reload-skills`.
- اكتب `/skills` لعرض المهارات المحمّلة.
- ينطبق `~/.claude/skills` على Claude Code المحلي فقط، ولا ينطبق على Cowork أو الـ session السحابية.

### Claude (claude.ai للويب، سطح المكتب)

متاح في الخطط المدفوعة (Pro وMax وTeam وEnterprise).

1. فعّل تنفيذ الشيفرة: **Settings > Capabilities > Code execution and file creation**. في خطتي Team/Enterprise، يجب على Owner تفعيل Skills وتنفيذ الشيفرة من **Organization settings > Plugins & skills**.
2. احزم كل مهارة من المهارات الخمس في ملف ZIP مستقل. يجب أن يكون المستوى الأعلى داخل ملف ZIP هو مجلد المهارة نفسه (مثل `palo-alto-architect/SKILL.md`)؛ لا تضع `SKILL.md` مباشرةً في جذر ملف ZIP.

   ```bash
   mkdir -p dist && cd skills
   for s in */; do zip -r "../dist/${s%/}.zip" "${s%/}"; done
   cd .. && unzip -l dist/senior-network-engineer.zip   # يجب أن يبدأ كل إدخال بـ senior-network-engineer/
   ```

   ```powershell
   # على Windows استخدم PowerShell 7 (pwsh)؛ فقد ينتج Compress-Archive في Windows PowerShell 5.1 صيغ مسارات غير متوافقة
   New-Item -ItemType Directory -Path dist -Force | Out-Null
   Get-ChildItem ./skills -Directory | ForEach-Object {
       Compress-Archive -Path $_.FullName -DestinationPath "dist/$($_.Name).zip" -Force
   }
   ```

3. انتقل إلى **Customize > Skills**، واختر **+** ← **Create skill** ← **Upload a skill**، ثم ارفع ملفات ZIP الخمسة واحدًا تلو الآخر وفعّلها جميعًا.
4. صِف مهمتك في المحادثة لاستخدامها تلقائيًا، أو اكتب `/` في مربع الإدخال لاختيار مهارة.

**حد طول الوصف:** يذكر مركز مساعدة Claude حدًا قدره 200 حرف للوصف (بينما تسمح وثائق المطورين على claude.com ومواصفة Agent Skills بـ 1,024 حرفًا). تلتزم هذه الحزمة بالحد الأكثر صرامة وهو 200 حرف؛ ويتراوح طول كل وصف من الأوصاف الخمسة بين 161 و177 حرفًا.

**بديل: ارفع المهارات الخمس دفعة واحدة على هيئة plugin** (خطة Pro أو أعلى). تتطلب plugins في Claude ملف manifest هو `.claude-plugin/plugin.json`، وهو غير مضمّن في هذا المستودع؛ لذا أنشئه عند الحزم:

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

ثم ارفع `dist/senior-network-engineer-bundle.zip` من **Customize > Plugins**.

### ChatGPT

**ChatGPT لسطح المكتب:** يتشارك المهارات المحلية مع Codex؛ ويكفي التثبيت في `~/.agents/skills` (انظر القسم التالي). اكتب `@` في ChatGPT لاختيار مهارة.

**ChatGPT للويب:** يقتصر على خطط Business وEnterprise وHealthcare وEdu، ويخضع لإعدادات مسؤول مساحة العمل (workspace).

1. اختر **Plugins** من الشريط الجانبي.
2. في **Plugin Directory**، افتح علامة التبويب **Skills**.
3. اختر **Create** ← **Upload from your computer** وارفع المهارات الخمس واحدة تلو الأخرى. يفحص ChatGPT كل ملف مرفوع أولًا؛ وقد تظهر النتيجة "Needs Review" أو "Blocked".

لا تحدد الوثائق الرسمية لـ OpenAI صيغة ملف الرفع. جرّب أولًا ملفات ZIP الخاصة بكل مهارة من القسم السابق؛ وإذا لم تُقبل، فعدّلها وفقًا للتعليمات الظاهرة في شاشة الرفع.

### OpenAI Codex (CLI، IDE extension)

```bash
DEST=~/.agents/skills        # لنطاق المشروع استخدم .agents/skills داخل المستودع
```

- انسخ أو أنشئ روابط باستخدام الأوامر الشائعة (الروابط مدعومة صراحةً في الوثائق الرسمية).
- يكتشف Codex تغييرات المهارات تلقائيًا؛ أعد تشغيل Codex إذا لم تظهر.
- استدعِ المهارة باستخدام `$senior-network-engineer`، أو نفّذ `/skills` لاختيار مهارة.
- أُزيل المسار القديم `$CODEX_HOME/skills` (أي `~/.codex/skills` عندما لا يكون `CODEX_HOME` معيّنًا) من الوثائق الرسمية، لكن Codex لا يزال يحمّله بوصفه مسارًا مهملًا (deprecated). إذا بقيت نسخة أخرى من هذه الحزمة هناك، فستظهر المهارات ذات الأسماء المتطابقة مرتين؛ لذا احذف التثبيت القديم.

### Google Antigravity (2.0، IDE، CLI)

```bash
DEST=~/.gemini/config/skills                # Antigravity 2.0 و IDE (عام)
DEST=~/.gemini/antigravity-cli/skills       # Antigravity CLI (عام)
DEST=<project-root>/.agents/skills          # نطاق المشروع المشترك بين الواجهات الثلاث
```

- تستخدم الواجهات الثلاث مسارات عامة مختلفة. إذا كنت تستخدم 2.0/IDE وCLI معًا، فثبّت في كلا المسارين العامين، أو استخدم بدلًا من ذلك `.agents/skills` على نطاق المشروع.
- لا يزال IDE يدعم المسار القديم `~/.gemini/antigravity/skills`.
- الترحيل من Gemini CLI: يقابل `~/.gemini/skills` المسار `~/.gemini/antigravity-cli/skills`؛ أما `.gemini/skills` الخاص بالمشروع فيجب إعادة تسميته أو نقله يدويًا إلى `.agents/skills`.
- يمكن لـ CLI أيضًا التثبيت عبر plugin: أنشئ مجلدًا يحتوي على `plugin.json` و`skills/`، ثم نفّذ `agy plugin install <plugin-folder>`؛ واكتب `/skills` في TUI لعرض المهارات المحمّلة.

### Gemini CLI

توقف Gemini CLI عن خدمة المستخدمين الأفراد في 2026-06-18 (وحلّ محله Antigravity CLI). ولا يمكن الاستمرار في استخدامه إلا بتراخيص Gemini Code Assist Standard/Enterprise ومفاتيح Gemini API المدفوعة.

```bash
DEST=~/.gemini/skills        # أو ~/.agents/skills؛ لنطاق المشروع استخدم .gemini/skills أو .agents/skills
```

- يمكنك أيضًا إنشاء الروابط باستخدام الأمر الرسمي: `gemini skills link ./skills`.
- نفّذ `/skills reload` داخل session لتحميل المهارات الجديدة، و`/skills list` لعرضها.
- لا يُمنح الوصول إلى ملفات مجلد المهارة إلا عند تفعيل المهارة؛ وقد تظهر لك مطالبة إذن عندما تقرأ المهارة الرئيسية إحدى الـ subskill.

### Cursor

```bash
DEST=~/.cursor/skills        # أو ~/.agents/skills؛ لنطاق المشروع استخدم .cursor/skills أو .agents/skills
```

- يكتشف Cursor المهارات تلقائيًا عند بدء التشغيل؛ ويمكنك عرضها من **Customize → Skills**.
- استدعِ المهارة بكتابة `/` في Agent chat واختيار مهارة.
- لا يُزامَن مع Cloud Agents إلا `~/.cursor/skills` (فعّل **Sync Skills for Cloud Agents** من **Settings → Agents**)؛ أما `~/.agents/skills` فلا يُزامَن مع Cloud Agents ولا مع SSH البعيد.

### GitHub Copilot (VS Code agent mode، Copilot CLI)

```bash
DEST=~/.copilot/skills       # أو ~/.agents/skills؛ لنطاق المشروع استخدم .github/skills أو .agents/skills
```

- إذا كان ترخيص Copilot لديك صادرًا من مؤسسة أو منشأة (enterprise)، فيجب على المسؤول السماح بالميزات ذات الصلة في السياسة (policy).
- في VS Code: اكتب `/skills` في Chat لفتح إعدادات المهارات. في Copilot CLI: `/skills list` و`/skills reload`.
- يعمل Copilot cloud agent وcode review على GitHub، ولا يقرآن إلا المهارات الموجودة داخل المستودع (نطاق المشروع).

### Hermes Agent

```bash
DEST=~/.hermes/skills/network   # ضع المهارات الخمس جميعها ضمن مجلد الفئة نفسه
```

- تسري المهارات الجديدة في session جديدة (أو نفّذ `/reset`).
- لا يُحمَّل `.hermes/skills` و`.agents/skills` الخاصان بالمشروع إلا بعد تنفيذ `hermes skills trust` في ذلك المستودع.
- إذا كانت المهارات مثبتة مسبقًا في `~/.agents/skills`، فأضف ذلك المسار إلى `skills.external_dirs` في `~/.hermes/config.yaml` لمشاركتها.
- لا يُنصح بالتثبيت واحدةً تلو الأخرى من GitHub باستخدام `hermes skills install`: إذ لا ينسخ إلا الملفات المشار إليها مباشرةً في `SKILL.md`، وبالتالي لا تُنزَّل المراجع `../` بين المهارات.

## الاستخدام

صِف مهمتك وستختار الأداة المهارات تلقائيًا بناءً على أوصافها. لاختيار مهارة بعينها صراحةً، استدعِها بالطريقة التي تدعمها منصتك (انظر جدول المرجع السريع). على سبيل المثال، في Codex:

```text
$senior-network-engineer حلّل حادثة الشبكة هذه متعددة الموردين. اذكر الأدلة والفرضيات أولًا، ثم قدّم MOP مع خطة تراجع (rollback). يُرجى الإجابة باللغة العربية.
```

بالنسبة إلى الأسئلة الخاصة بمورد واحد، يمكنك استدعاء subskill مباشرةً، مثل `palo-alto-architect` أو `fortinet-security-fabric-architect` أو `cisco-network-dc-architect` أو `hpe-aruba-network-architect`.

## التحديث

على الجهاز الذي أجريت عليه التغييرات:

```bash
git status --short
git add -- <files-you-actually-changed>
git commit -m "<single-purpose description>"
git push
```

على الأجهزة الأخرى:

```bash
git pull --ff-only
```

- الأدوات المثبتة عبر الروابط: تسري التغييرات فور تنفيذ pull.
- الأدوات المثبتة بالنسخ: أعد تنفيذ أمر النسخ بعد pull.
- المنصات القائمة على الرفع (Claude، وChatGPT للويب): أعد حزم المهارات التي تغيّرت وأعد رفعها.

## المعلومات المرتبطة بالوقت

- تستند الإصدارات وEoL/EoS وCVE وRecommended Releases ودعم PQC وقدرات أدوات الذكاء الاصطناعي إلى وثائق المورد أو الوثائق الرسمية، مع ذكر تاريخ التحقق في النص.
- تتغير مسارات المهارات وخطوات الرفع في أدوات الذكاء الاصطناعي كثيرًا. يعكس هذا المستند الوثائق الرسمية حتى تاريخ 2026-09-27؛ وإذا لم تُحمَّل مهارة بعد تثبيتها، فراجع أحدث وثائق الأداة أولًا.
- في وقت التحقق، لم يكن من الممكن العثور على العناصر التالية إلا في مصادر خارجية أو مجتمعية، لأن الصفحات الرسمية تتطلب تسجيل الدخول إلى بوابة دعم المورد. ويصنّفها محتوى المهارات على أنها "يجب إعادة التحقق قبل الاستشهاد بها":
  - تاريخ EoS لـ FortiNAC 9.4 وتاريخ End of Order لـ FortiGate CNF (Fortinet Product Life Cycle، يتطلب حساب FortiCare)
  - تاريخ EoS لبرنامج AirWave وحالة إيقاف البيع (end-of-sale) لـ 2930F/2930M/5400R (HPE Networking Support Portal)
- عند تحديث المحتوى المرتبط بالوقت، حدّث أيضًا تاريخ التحقق في القسم المعني وقيمة `version` في `bundle-manifest.json`.

## قواعد الصيانة

- عدّل المهارات المرجعية داخل `skills/` فقط؛ ولا تعدّل النسخ الموجودة في مواقع التثبيت.
- أبقِ المهارات الخمس في المستوى نفسه؛ واجعل `SKILL.md` موجزًا وأقل من 500 سطر، مع وضع التفاصيل في `references/` بعمق مستوى واحد.
- يجب أن تطابق قيمة `name` في الـ frontmatter اسم المجلد؛ ويجب ألا يتجاوز `description` 200 حرف (ليتوافق مع حد الرفع في مركز مساعدة Claude)، وأن يوضح ما تفعله المهارة ومتى يجب تشغيلها.
- لا تعتمد على الذاكرة في ادعاء CVE أو fixed release أو EoL أو PQC أو CLI أو الترخيص أو ميزات منصات الذكاء الاصطناعي؛ بل اعتمد على وثائق المورد أو الوثائق الرسمية وسجّل تاريخ التحقق.
- لا تُودِع (commit) إعدادات العملاء أو ملفات PCAP أو الحسابات أو كلمات المرور أو PSK أو المفاتيح الخاصة أو API tokens أو التراخيص أو مرفقات التذاكر.
- يجب أن تتضمن التوصيات عالية المخاطر الأدلة وblast radius وشروط التوقف وخطة التراجع (rollback) والتحقق.
- يُعدّ `README.md` (الصينية التقليدية) ملف README المرجعي. عند تغييره، حدّث كل ترجمات `README/README.<lang>.md` في الـ commit نفسه.
