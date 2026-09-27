# Senior Network Engineer Skill Bundle

[繁體中文](../README.md) | [English](README.en.md) | [简体中文](README.zh-CN.md) | [粵語](README.yue.md) | [日本語](README.ja.md) | [한국어](README.ko.md) | [Español](README.es.md) | [Português (Brasil)](README.pt-BR.md) | [Français](README.fr.md) | [Deutsch](README.de.md) | [Русский](README.ru.md) | [Tiếng Việt](README.vi.md) | [Bahasa Indonesia](README.id.md) | [ไทย](README.th.md) | **Türkçe** | [العربية](README.ar.md)

Kıdemli ağ mühendisleri için kişisel bir skill paketi: üreticiler arası tek bir ana skill ve dört üreticiye özel subskill; birden fazla bilgisayarın ve AI aracının tek bir doğruluk kaynağını paylaşması için tek bir Git deposunda tutulur.

Skill'ler [Agent Skills açık formatını](https://agentskills.io/specification) izler (her klasör `SKILL.md` ve isteğe bağlı bir `references/` içerir) ve Claude, ChatGPT/Codex, Google Antigravity, Gemini CLI, Cursor, GitHub Copilot ile bu formatı destekleyen diğer araçlara kurulabilir.

Zamana duyarlı içerik (sürümler, EoL, CVE'ler, PQC, AI aracı yetenekleri ve kurulum yolları) **2026-09-27** itibarıyla doğrulanmıştır.

> **Dil notu:** Skill içeriği Geleneksel Çince yazılmıştır ve AI'a varsayılan olarak Tayvan kurumsal BT terminolojisiyle Geleneksel Çince yanıt vermesini söyler. Yanıtları başka bir dilde istiyorsanız bunu isteğinizde açıkça belirtin.

## İçindekiler

- [Dahil edilen skill'ler](#dahil-edilen-skilller)
- [Dizin yapısı](#dizin-yapısı)
- [Kurulumdan önce](#kurulumdan-önce)
- [Ortak kurulum komutları](#ortak-kurulum-komutları)
- [Platforma göre kurulum](#platforma-göre-kurulum)
- [Kullanım](#kullanım)
- [Güncelleme](#güncelleme)
- [Zamana duyarlı bilgiler](#zamana-duyarlı-bilgiler)
- [Bakım kuralları](#bakım-kuralları)

## Dahil edilen skill'ler

| Skill | Kapsam |
|---|---|
| `senior-network-engineer` | Ana skill. Üreticiler arası mimari ve sorun giderme, paket/session analizi, HA/DR, CVE ve sürüm yönetişimi, PQC, CEH/CISSP güvenlik temelleri, AI Agent/MCP yönetişimi, müşteri ve üretici iletişimi, HLD/LLD/MOP/RCA ve eğitim; soruları aşağıdaki subskill'lere yönlendirir |
| `palo-alto-architect` | PAN-OS NGFW, Panorama, Strata Cloud Manager, Prisma SASE, Cortex (XDR/XSIAM/XSOAR/AgentiX/Cortex Cloud), CVE'ler ve PQC |
| `fortinet-security-fabric-architect` | FortiGate/FortiOS, FortiManager, FortiAnalyzer, SD-WAN, ZTNA, SSL VPN'den IPsec'e geçiş, PSIRT ve PQC/QKD |
| `cisco-network-dc-architect` | Catalyst, Nexus/Nexus Dashboard, ACI, VXLAN EVPN, Catalyst SD-WAN, 9800/CW9800 WLC, ISE, Secure Firewall, PSIRT ve PQC/MACsec |
| `hpe-aruba-network-architect` | AOS-8/AOS-10, Instant AOS-8, HPE Aruba Networking Central, ClearPass, AOS-CX/AOS-Switch, HPE Security Bulletins ve PPK/PQC |

## Dizin yapısı

```text
.
├── README.md                             # Geleneksel Çince (kanonik)
├── README/                               # Çeviriler (15 dil)
│   └── README.<lang>.md
├── bundle-manifest.json                  # Paket adı, sürüm ve skill listesi
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

## Kurulumdan önce

1. **Beş skill'in tamamını aynı klasöre kurun.** Ana skill, subskill'leri `../<subskill>/SKILL.md` göreli yolu üzerinden yükler; bu yol yalnızca beş klasör yan yana durduğunda çözümlenir.
2. **Klasörleri yeniden adlandırmayın.** Çoğu araç, klasör adının `SKILL.md` içindeki `name` ile eşleşmesini gerektirir; ikisi farklı olduğunda skill'i sessizce atlayabilir.
3. **Yükleme tabanlı platformlarda (Claude web/masaüstü, ChatGPT web) beşini de yükleyip etkinleştirin.** Bu platformlarda her skill bağımsızdır. Anthropic Help Center, skill'lerin diğer skill'lere açıkça başvuramayacağını belirtir; ancak Claude uygun olduğunda birden fazla skill'i otomatik olarak birlikte kullanır.
4. **Bir kez kurun, araçlar arasında paylaşın.** `~/.agents/skills`; Codex/ChatGPT masaüstü, Cursor, GitHub Copilot ve Gemini CLI tarafından okunan, araçlar arası ortak bir konumdur; Claude Code ve Antigravity ise kendi dizinlerine ihtiyaç duyar.

## Ortak kurulum komutları

Önce bu depoyu klonlayın, ardından komutları depo kök dizininden çalıştırın. `$dest` / `DEST` değerini, bir sonraki bölümdeki tablodan platformunuza ait yolla değiştirin.

**Windows (PowerShell)**

```powershell
git clone https://github.com/Scorpio-meow/senior-network-engineer-skill-bundle.git
Set-Location senior-network-engineer-skill-bundle

$dest = Join-Path $HOME '.agents/skills'      # Platforma göre değiştirin
New-Item -ItemType Directory -Path $dest -Force | Out-Null

# Seçenek 1: Kopyalama (en iyi uyumluluk; her güncellemeden sonra yeniden kopyalayın)
Copy-Item ./skills/* $dest -Recurse -Force

# Seçenek 2: Junction'lar (depodaki değişiklikler hemen geçerli olur; yalnızca link'leri resmi olarak destekleyen araçlar için)
Get-ChildItem ./skills -Directory | ForEach-Object {
    New-Item -ItemType Junction -Path (Join-Path $dest $_.Name) -Target $_.FullName
}
```

**macOS / Linux**

```bash
git clone https://github.com/Scorpio-meow/senior-network-engineer-skill-bundle.git
cd senior-network-engineer-skill-bundle

DEST=~/.agents/skills        # Platforma göre değiştirin
mkdir -p "$DEST"

# Seçenek 1: Kopyalama
cp -R skills/* "$DEST/"

# Seçenek 2: Symlink'ler (yalnızca link'leri resmi olarak destekleyen araçlar için)
for d in "$PWD"/skills/*/; do ln -s "${d%/}" "$DEST/"; done
```

Hedefte aynı ada sahip bir klasör zaten varsa link oluşturma başarısız olur; önce eski sürümü kendiniz yedekleyin veya kaldırın.

## Platforma göre kurulum

### Hızlı başvuru

| Platform | Kişisel (global) yol | Proje yolu | Link desteği | Manuel çağırma |
|---|---|---|---|---|
| Claude Code | `~/.claude/skills` | `.claude/skills` | Evet | `/senior-network-engineer` |
| Claude web/masaüstü | ZIP yükleme (aşağıya bakın) | — | — | `/` yazıp seçin |
| ChatGPT masaüstü, Codex CLI/IDE | `~/.agents/skills` | `.agents/skills` | Evet | ChatGPT: `@`; Codex: `$senior-network-engineer` veya `/skills` |
| ChatGPT web | Yükleme (aşağıya bakın) | — | — | Otomatik veya `@` |
| Antigravity 2.0 / IDE | `~/.gemini/config/skills` | `.agents/skills` | Belgelenmemiş | `/senior-network-engineer` |
| Antigravity CLI | `~/.gemini/antigravity-cli/skills` | `.agents/skills` | Belgelenmemiş | `/senior-network-engineer` |
| Gemini CLI | `~/.gemini/skills` veya `~/.agents/skills` | `.gemini/skills` veya `.agents/skills` | Evet | Otomatik (görüntülemek için `/skills list`) |
| Cursor | `~/.cursor/skills` veya `~/.agents/skills` | `.cursor/skills` veya `.agents/skills` | Belgelenmemiş | Agent chat'te `/` yazın |
| GitHub Copilot (VS Code, CLI) | `~/.copilot/skills` veya `~/.agents/skills` | `.github/skills` veya `.agents/skills` | Belgelenmemiş | `/senior-network-engineer` |
| Hermes Agent | `~/.hermes/skills/<kategori>` | `.hermes/skills` veya `.agents/skills` | Belgelenmemiş | `/senior-network-engineer` |

Her araç, bir skill'in açıklaması (description) göreve uyduğunda o skill'i ayrıca otomatik olarak yükler. "Belgelenmemiş" olarak işaretlenen araçlarda resmi dokümanlar link desteği olup olmadığını belirtmez; kopyalayarak kurun.

### Claude Code

```bash
DEST=~/.claude/skills        # Proje kapsamı için .claude/skills kullanın
```

- Ortak komutlarla kopyalayın veya link oluşturun (link'ler resmi dokümanlarda açıkça desteklenir).
- Değişiklikler mevcut session'da otomatik olarak geçerli olur; başlangıçta `~/.claude/skills` mevcut değilse `/reload-skills` çalıştırın.
- Yüklenen skill'leri görüntülemek için `/skills` yazın.
- `~/.claude/skills` yalnızca yerel Claude Code için geçerlidir; Cowork veya bulut session'larına uygulanmaz.

### Claude (claude.ai web, masaüstü)

Ücretli planlarda (Pro, Max, Team, Enterprise) kullanılabilir.

1. Kod çalıştırmayı etkinleştirin: **Settings > Capabilities > Code execution and file creation**. Team/Enterprise'da bir Owner'ın **Organization settings > Plugins & skills** altında Skills ve kod çalıştırmayı etkinleştirmesi gerekir.
2. Beş skill'in her birini ayrı bir ZIP olarak paketleyin. ZIP içindeki en üst düzey, skill klasörünün kendisi olmalıdır (örneğin `palo-alto-architect/SKILL.md`); `SKILL.md` dosyasını doğrudan ZIP kök dizinine koymayın.

   ```bash
   mkdir -p dist && cd skills
   for s in */; do zip -r "../dist/${s%/}.zip" "${s%/}"; done
   cd .. && unzip -l dist/senior-network-engineer.zip   # Her girdi senior-network-engineer/ ile başlamalıdır
   ```

   ```powershell
   # Windows'ta PowerShell 7 (pwsh) kullanın; Windows PowerShell 5.1'deki Compress-Archive uyumsuz yol biçimleri üretebilir
   New-Item -ItemType Directory -Path dist -Force | Out-Null
   Get-ChildItem ./skills -Directory | ForEach-Object {
       Compress-Archive -Path $_.FullName -DestinationPath "dist/$($_.Name).zip" -Force
   }
   ```

3. **Customize > Skills** bölümüne gidin, **+** → **Create skill** → **Upload a skill** seçin, beş ZIP'i tek tek yükleyin ve hepsini etkinleştirin.
4. Skill'leri otomatik olarak kullanmak için bir sohbette görevinizi açıklayın veya bir skill seçmek için giriş kutusuna `/` yazın.

**Açıklama uzunluğu sınırı:** Claude Help Center, açıklamalar için 200 karakterlik bir sınır belirtir (claude.com geliştirici dokümanları ve Agent Skills spesifikasyonu 1.024 karaktere izin verir). Bu paket daha katı olan 200 karakter sınırına uyar; beş açıklamanın her biri 161–177 karakterdir.

**Alternatif: beş skill'in tamamını tek seferde bir plugin olarak yükleyin** (Pro plan veya üstü). Claude plugin'leri bir `.claude-plugin/plugin.json` manifest'i gerektirir; bu depo bunu içermez, paketleme sırasında oluşturun:

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

Ardından `dist/senior-network-engineer-bundle.zip` dosyasını **Customize > Plugins** bölümünde yükleyin.

### ChatGPT

**ChatGPT masaüstü:** Yerel skill'leri Codex ile paylaşır; `~/.agents/skills` konumuna kurmak yeterlidir (bir sonraki bölüme bakın). Bir skill seçmek için ChatGPT'de `@` yazın.

**ChatGPT web:** Business, Enterprise, Healthcare ve Edu planlarıyla sınırlıdır ve workspace yönetici ayarlarına tabidir.

1. Kenar çubuğunda **Plugins** öğesini seçin.
2. **Plugin Directory** içinde **Skills** sekmesini açın.
3. **Create** → **Upload from your computer** seçin ve beş skill'i tek tek yükleyin. ChatGPT her yüklemeyi önce tarar; sonuç "Needs Review" veya "Blocked" olarak görünebilir.

OpenAI'ın resmi dokümanları yükleme dosya biçimini belirtmez. Önce önceki bölümdeki skill başına ayrı ZIP'leri deneyin; kabul edilmezlerse yükleme ekranındaki talimatlara göre düzenleyin.

### OpenAI Codex (CLI, IDE eklentisi)

```bash
DEST=~/.agents/skills        # Proje kapsamı için depo içindeki .agents/skills kullanın
```

- Ortak komutlarla kopyalayın veya link oluşturun (link'ler resmi dokümanlarda açıkça desteklenir).
- Codex skill değişikliklerini otomatik olarak algılar; görünmezlerse Codex'i yeniden başlatın.
- `$senior-network-engineer` ile çağırın veya birini seçmek için `/skills` çalıştırın.
- Eski yol `$CODEX_HOME/skills` (`CODEX_HOME` ayarlanmamışsa `~/.codex/skills`) resmi dokümanlardan kaldırılmıştır, ancak Codex bu yolu kullanımdan kaldırılmış (deprecated) bir yol olarak hâlâ yükler. Bu paketin başka bir kopyası orada kalmışsa aynı adlı skill'ler iki kez görünür; eski kurulumu kaldırın.

### Google Antigravity (2.0, IDE, CLI)

```bash
DEST=~/.gemini/config/skills                # Antigravity 2.0 ve IDE (global)
DEST=~/.gemini/antigravity-cli/skills       # Antigravity CLI (global)
DEST=<proje-kökü>/.agents/skills            # Üçünün ortak kullandığı proje kapsamı
```

- Üç arayüz farklı global yollar kullanır. Hem 2.0/IDE'yi hem de CLI'ı kullanıyorsanız her iki global yola da kurun veya bunun yerine proje kapsamlı `.agents/skills` konumunu kullanın.
- IDE, eski `~/.gemini/antigravity/skills` yolunu hâlâ destekler.
- Gemini CLI'dan geçiş: `~/.gemini/skills`, `~/.gemini/antigravity-cli/skills` yoluna karşılık gelir; bir projenin `.gemini/skills` klasörü elle yeniden adlandırılmalı veya `.agents/skills` konumuna taşınmalıdır.
- CLI, plugin üzerinden de kurulum yapabilir: `plugin.json` ve `skills/` içeren bir klasör oluşturun, ardından `agy plugin install <plugin-klasörü>` çalıştırın; yüklenen skill'leri görüntülemek için TUI'de `/skills` yazın.

### Gemini CLI

Gemini CLI, 2026-06-18 tarihinde bireysel kullanıcılara hizmet vermeyi durdurdu (yerini Antigravity CLI aldı). Yalnızca Gemini Code Assist Standard/Enterprise lisansları ve ücretli Gemini API anahtarları kullanmaya devam edebilir.

```bash
DEST=~/.gemini/skills        # Veya ~/.agents/skills; proje kapsamı için .gemini/skills veya .agents/skills kullanın
```

- Resmi komutla da link oluşturabilirsiniz: `gemini skills link ./skills`.
- Yeni skill'leri yüklemek için bir session içinde `/skills reload`, görüntülemek için `/skills list` çalıştırın.
- Bir skill'in klasörüne dosya erişimi yalnızca skill etkinleştirildiğinde verilir; ana skill bir subskill'i okuduğunda bir izin istemi görebilirsiniz.

### Cursor

```bash
DEST=~/.cursor/skills        # Veya ~/.agents/skills; proje kapsamı için .cursor/skills veya .agents/skills kullanın
```

- Cursor, skill'leri başlangıçta otomatik olarak keşfeder; bunları **Customize → Skills** içinde görüntüleyin.
- Agent chat'te `/` yazıp bir skill seçerek çağırın.
- Yalnızca `~/.cursor/skills` Cloud Agents ile senkronize edilir (**Settings → Agents** içinde **Sync Skills for Cloud Agents** seçeneğini etkinleştirin); `~/.agents/skills` Cloud Agents'a veya uzak SSH ortamına senkronize edilmez.

### GitHub Copilot (VS Code agent mode, Copilot CLI)

```bash
DEST=~/.copilot/skills       # Veya ~/.agents/skills; proje kapsamı için .github/skills veya .agents/skills kullanın
```

- Copilot lisansınız bir organization veya enterprise üzerinden geliyorsa, bir yöneticinin ilgili özelliklere politikada izin vermesi gerekir.
- VS Code: skill ayarlarını açmak için Chat'te `/skills` yazın. Copilot CLI: `/skills list`, `/skills reload`.
- Copilot cloud agent ve code review GitHub üzerinde çalışır ve yalnızca depo içindeki skill'leri (proje kapsamı) okur.

### Hermes Agent

```bash
DEST=~/.hermes/skills/network   # Beş skill'in tamamını aynı kategori klasörüne koyun
```

- Yeni skill'ler yeni bir session'da geçerli olur (veya `/reset` çalıştırın).
- Bir projenin `.hermes/skills` ve `.agents/skills` klasörleri, yalnızca o depoda `hermes skills trust` çalıştırdıktan sonra yüklenir.
- Skill'ler zaten `~/.agents/skills` konumuna kuruluysa, bunları paylaşmak için bu yolu `~/.hermes/config.yaml` içindeki `skills.external_dirs` ayarına ekleyin.
- GitHub'dan `hermes skills install` ile tek tek kurulum önerilmez: yalnızca `SKILL.md` tarafından doğrudan başvurulan dosyaları kopyalar, bu nedenle skill'ler arası `../` başvuruları indirilmez.

## Kullanım

Görevinizi açıklayın; araç, açıklamalarına göre skill'leri otomatik olarak seçer. Birini açıkça seçmek için platformunuzun desteklediği şekilde çağırın (hızlı başvuru tablosuna bakın). Örneğin Codex'te:

```text
$senior-network-engineer Bu üreticiler arası ağ olayını analiz et. Önce kanıtları ve hipotezleri listele, ardından geri alma planı içeren bir MOP sun. Lütfen Türkçe yanıt ver.
```

Tek üreticili sorular için `palo-alto-architect`, `fortinet-security-fabric-architect`, `cisco-network-dc-architect` veya `hpe-aruba-network-architect` gibi bir subskill'i doğrudan çağırabilirsiniz.

## Güncelleme

Değişiklik yaptığınız bilgisayarda:

```bash
git status --short
git add -- <gerçekten-değiştirdiğiniz-dosyalar>
git commit -m "<tek amaçlı açıklama>"
git push
```

Diğer bilgisayarlarda:

```bash
git pull --ff-only
```

- Link ile kurulan araçlar: değişiklikler pull işleminden hemen sonra geçerli olur.
- Kopyalanarak kurulan araçlar: pull işleminden sonra kopyalama komutunu yeniden çalıştırın.
- Yükleme tabanlı platformlar (Claude, ChatGPT web): değişen skill'leri yeniden paketleyip yeniden yükleyin.

## Zamana duyarlı bilgiler

- Sürümler, EoL/EoS, CVE'ler, Recommended Releases, PQC desteği ve AI aracı yetenekleri üretici veya resmi dokümanlara dayanır; doğrulama tarihi metinde belirtilmiştir.
- AI araçlarının skill yolları ve yükleme akışları sık değişir. Bu belge 2026-09-27 itibarıyla resmi dokümanları yansıtır; kurulumdan sonra bir skill yüklenmezse önce aracın en güncel dokümanlarını kontrol edin.
- Doğrulama sırasında aşağıdaki öğeler, resmi sayfalar üretici destek portalına giriş gerektirdiği için yalnızca üçüncü taraf veya topluluk kaynaklarında bulunabildi. Skill içeriği bunları "alıntılamadan önce yeniden doğrulayın" olarak işaretler:
  - FortiNAC 9.4 EoS ve FortiGate CNF End of Order tarihleri (Fortinet Product Life Cycle, FortiCare hesabı gerektirir)
  - AirWave yazılımının EoS tarihi ve 2930F/2930M/5400R modellerinin satış sonu (end-of-sale) durumu (HPE Networking Support Portal)
- Zamana duyarlı içeriği güncellerken ilgili bölümdeki doğrulama tarihini ve `bundle-manifest.json` içindeki `version` değerini de güncelleyin.

## Bakım kuralları

- Kanonik skill'leri yalnızca `skills/` içinde düzenleyin; kurulum konumlarındaki kopyaları düzenlemeyin.
- Beş skill'i aynı düzeyde tutun; `SKILL.md` dosyasını kısa ve 500 satırın altında tutun, ayrıntıları bir düzey derinliğindeki `references/` içine koyun.
- Frontmatter'daki `name` klasör adıyla eşleşmelidir; `description` en fazla 200 karakter olmalı (Claude Help Center yükleme sınırına uymak için) ve hem skill'in ne yaptığını hem de ne zaman tetikleneceğini belirtmelidir.
- CVE'ler, fixed release'ler, EoL, PQC, CLI, lisanslama veya AI platform özellikleri hakkında hafızadan iddiada bulunmayın; üretici veya resmi dokümanlara dayanın ve doğrulama tarihini kaydedin.
- Müşteri yapılandırmalarını, PCAP'leri, hesapları, parolaları, PSK'leri, özel anahtarları, API token'larını, lisansları veya destek kaydı (ticket) eklerini commit etmeyin.
- Yüksek riskli öneriler kanıt, blast radius, durdurma koşulları, rollback ve doğrulama içermelidir.
- `README.md` (Geleneksel Çince) kanonik README'dir. Değiştirirken her `README/README.<lang>.md` çevirisini aynı commit içinde güncelleyin.
