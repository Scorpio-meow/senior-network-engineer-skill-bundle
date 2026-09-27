# Senior Network Engineer Skill Bundle

[繁體中文](../README.md) | [English](README.en.md) | [简体中文](README.zh-CN.md) | [粵語](README.yue.md) | [日本語](README.ja.md) | [한국어](README.ko.md) | [Español](README.es.md) | [Português (Brasil)](README.pt-BR.md) | [Français](README.fr.md) | [Deutsch](README.de.md) | [Русский](README.ru.md) | [Tiếng Việt](README.vi.md) | [Bahasa Indonesia](README.id.md) | **ไทย** | [Türkçe](README.tr.md) | [العربية](README.ar.md)

ชุดสกิลส่วนตัวสำหรับวิศวกรเครือข่ายอาวุโส ประกอบด้วยสกิลหลักแบบข้ามผู้ผลิตหนึ่งตัวและ subskill เฉพาะผู้ผลิตอีกสี่ตัว เก็บไว้ใน Git repository เดียว เพื่อให้คอมพิวเตอร์และเครื่องมือ AI หลายตัวใช้แหล่งข้อมูลต้นฉบับเดียวกัน (single source of truth)

สกิลทั้งหมดเป็นไปตาม [Agent Skills open format](https://agentskills.io/specification) (แต่ละโฟลเดอร์มี `SKILL.md` และ `references/` ซึ่งมีหรือไม่มีก็ได้) และสามารถติดตั้งลงใน Claude, ChatGPT/Codex, Google Antigravity, Gemini CLI, Cursor, GitHub Copilot และเครื่องมืออื่นที่รองรับรูปแบบนี้

เนื้อหาที่ขึ้นกับเวลา (เวอร์ชัน, EoL, CVE, PQC, ความสามารถของเครื่องมือ AI และพาธการติดตั้ง) ได้รับการตรวจสอบ ณ วันที่ **2026-09-27**

> **หมายเหตุด้านภาษา:** เนื้อหาของสกิลเขียนเป็นภาษาจีนตัวเต็ม และกำหนดให้ AI ตอบเป็นภาษาจีนตัวเต็มโดยใช้คำศัพท์ IT องค์กรแบบไต้หวันเป็นค่าเริ่มต้น หากต้องการคำตอบเป็นภาษาอื่น ให้ระบุภาษาอย่างชัดเจนในคำขอ

## สารบัญ

- [สกิลที่รวมอยู่](#สกิลที่รวมอยู่)
- [โครงสร้างไดเรกทอรี](#โครงสร้างไดเรกทอรี)
- [ก่อนติดตั้ง](#ก่อนติดตั้ง)
- [คำสั่งติดตั้งทั่วไป](#คำสั่งติดตั้งทั่วไป)
- [การติดตั้งแยกตามแพลตฟอร์ม](#การติดตั้งแยกตามแพลตฟอร์ม)
- [การใช้งาน](#การใช้งาน)
- [การอัปเดต](#การอัปเดต)
- [ข้อมูลที่ขึ้นกับเวลา](#ข้อมูลที่ขึ้นกับเวลา)
- [กฎการดูแลรักษา](#กฎการดูแลรักษา)

## สกิลที่รวมอยู่

| สกิล | ขอบเขต |
|---|---|
| `senior-network-engineer` | สกิลหลัก ครอบคลุมสถาปัตยกรรมและการแก้ไขปัญหาแบบข้ามผู้ผลิต, การวิเคราะห์ packet/session, HA/DR, การกำกับดูแล CVE และเวอร์ชัน, PQC, พื้นฐานความปลอดภัยตาม CEH/CISSP, การกำกับดูแล AI Agent/MCP, การสื่อสารกับลูกค้าและผู้ผลิต, HLD/LLD/MOP/RCA และการฝึกอบรม พร้อมส่งต่อคำถามไปยัง subskill ด้านล่าง |
| `palo-alto-architect` | PAN-OS NGFW, Panorama, Strata Cloud Manager, Prisma SASE, Cortex (XDR/XSIAM/XSOAR/AgentiX/Cortex Cloud), CVE และ PQC |
| `fortinet-security-fabric-architect` | FortiGate/FortiOS, FortiManager, FortiAnalyzer, SD-WAN, ZTNA, การย้ายจาก SSL VPN ไป IPsec, PSIRT และ PQC/QKD |
| `cisco-network-dc-architect` | Catalyst, Nexus/Nexus Dashboard, ACI, VXLAN EVPN, Catalyst SD-WAN, 9800/CW9800 WLC, ISE, Secure Firewall, PSIRT และ PQC/MACsec |
| `hpe-aruba-network-architect` | AOS-8/AOS-10, Instant AOS-8, HPE Aruba Networking Central, ClearPass, AOS-CX/AOS-Switch, HPE Security Bulletins และ PPK/PQC |

## โครงสร้างไดเรกทอรี

```text
.
├── README.md                             # ภาษาจีนตัวเต็ม (ฉบับหลัก)
├── README/                               # ฉบับแปล (15 ภาษา)
│   └── README.<lang>.md
├── bundle-manifest.json                  # ชื่อ bundle, เวอร์ชัน และรายการสกิล
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

## ก่อนติดตั้ง

1. **ติดตั้งสกิลทั้งห้าตัวไว้ในโฟลเดอร์เดียวกัน** สกิลหลักโหลด subskill ผ่านพาธสัมพัทธ์ `../<subskill>/SKILL.md` ซึ่งจะ resolve ได้ก็ต่อเมื่อโฟลเดอร์ทั้งห้าอยู่ระดับเดียวกันเท่านั้น
2. **อย่าเปลี่ยนชื่อโฟลเดอร์** เครื่องมือส่วนใหญ่กำหนดให้ชื่อโฟลเดอร์ตรงกับ `name` ใน `SKILL.md` และอาจข้ามสกิลนั้นไปโดยไม่แจ้งเตือนหากไม่ตรงกัน
3. **บนแพลตฟอร์มแบบอัปโหลด (Claude เว็บ/เดสก์ท็อป, ChatGPT เว็บ) ให้อัปโหลดและเปิดใช้งานครบทั้งห้าตัว** บนแพลตฟอร์มเหล่านี้แต่ละสกิลทำงานแยกกัน Anthropic Help Center ระบุว่าสกิลไม่สามารถอ้างอิงสกิลอื่นอย่างชัดแจ้งได้ แต่ Claude จะผสานการทำงานของหลายสกิลโดยอัตโนมัติเมื่อเหมาะสม
4. **ติดตั้งครั้งเดียว ใช้ร่วมกันได้หลายเครื่องมือ** `~/.agents/skills` เป็นตำแหน่งกลางที่ Codex/ChatGPT เดสก์ท็อป, Cursor, GitHub Copilot และ Gemini CLI อ่านได้ ส่วน Claude Code และ Antigravity ต้องใช้ไดเรกทอรีของตัวเอง

## คำสั่งติดตั้งทั่วไป

ให้ clone repository นี้ก่อน แล้วรันคำสั่งจาก root ของ repository แทนที่ `$dest` / `DEST` ด้วยพาธของแพลตฟอร์มของคุณจากตารางในหัวข้อถัดไป

**Windows (PowerShell)**

```powershell
git clone https://github.com/Scorpio-meow/senior-network-engineer-skill-bundle.git
Set-Location senior-network-engineer-skill-bundle

$dest = Join-Path $HOME '.agents/skills'      # เปลี่ยนตามแพลตฟอร์ม
New-Item -ItemType Directory -Path $dest -Force | Out-Null

# วิธีที่ 1: คัดลอก (เข้ากันได้ดีที่สุด; ต้องคัดลอกใหม่ทุกครั้งที่อัปเดต)
Copy-Item ./skills/* $dest -Recurse -Force

# วิธีที่ 2: Junction (การแก้ไขใน repository มีผลทันที; ใช้เฉพาะกับเครื่องมือที่รองรับลิงก์อย่างเป็นทางการ)
Get-ChildItem ./skills -Directory | ForEach-Object {
    New-Item -ItemType Junction -Path (Join-Path $dest $_.Name) -Target $_.FullName
}
```

**macOS / Linux**

```bash
git clone https://github.com/Scorpio-meow/senior-network-engineer-skill-bundle.git
cd senior-network-engineer-skill-bundle

DEST=~/.agents/skills        # เปลี่ยนตามแพลตฟอร์ม
mkdir -p "$DEST"

# วิธีที่ 1: คัดลอก
cp -R skills/* "$DEST/"

# วิธีที่ 2: Symlink (ใช้เฉพาะกับเครื่องมือที่รองรับลิงก์อย่างเป็นทางการ)
for d in "$PWD"/skills/*/; do ln -s "${d%/}" "$DEST/"; done
```

การสร้างลิงก์จะล้มเหลวหากปลายทางมีโฟลเดอร์ชื่อเดียวกันอยู่แล้ว ให้สำรองหรือลบเวอร์ชันเก่าด้วยตนเองก่อน

## การติดตั้งแยกตามแพลตฟอร์ม

### ตารางอ้างอิงด่วน

| แพลตฟอร์ม | พาธส่วนตัว (global) | พาธระดับโปรเจกต์ | รองรับลิงก์ | การเรียกใช้ด้วยตนเอง |
|---|---|---|---|---|
| Claude Code | `~/.claude/skills` | `.claude/skills` | รองรับ | `/senior-network-engineer` |
| Claude เว็บ/เดสก์ท็อป | อัปโหลด ZIP (ดูด้านล่าง) | — | — | พิมพ์ `/` แล้วเลือก |
| ChatGPT เดสก์ท็อป, Codex CLI/IDE | `~/.agents/skills` | `.agents/skills` | รองรับ | ChatGPT: `@`; Codex: `$senior-network-engineer` หรือ `/skills` |
| ChatGPT เว็บ | อัปโหลด (ดูด้านล่าง) | — | — | อัตโนมัติ หรือ `@` |
| Antigravity 2.0 / IDE | `~/.gemini/config/skills` | `.agents/skills` | ไม่ได้ระบุในเอกสาร | `/senior-network-engineer` |
| Antigravity CLI | `~/.gemini/antigravity-cli/skills` | `.agents/skills` | ไม่ได้ระบุในเอกสาร | `/senior-network-engineer` |
| Gemini CLI | `~/.gemini/skills` หรือ `~/.agents/skills` | `.gemini/skills` หรือ `.agents/skills` | รองรับ | อัตโนมัติ (ดูรายการด้วย `/skills list`) |
| Cursor | `~/.cursor/skills` หรือ `~/.agents/skills` | `.cursor/skills` หรือ `.agents/skills` | ไม่ได้ระบุในเอกสาร | พิมพ์ `/` ใน Agent chat |
| GitHub Copilot (VS Code, CLI) | `~/.copilot/skills` หรือ `~/.agents/skills` | `.github/skills` หรือ `.agents/skills` | ไม่ได้ระบุในเอกสาร | `/senior-network-engineer` |
| Hermes Agent | `~/.hermes/skills/<หมวดหมู่>` | `.hermes/skills` หรือ `.agents/skills` | ไม่ได้ระบุในเอกสาร | `/senior-network-engineer` |

ทุกเครื่องมือจะโหลดสกิลโดยอัตโนมัติเช่นกันเมื่อคำอธิบาย (description) ของสกิลตรงกับงาน สำหรับเครื่องมือที่ระบุว่า "ไม่ได้ระบุในเอกสาร" เอกสารทางการไม่ได้บอกว่ารองรับลิงก์หรือไม่ ให้ติดตั้งด้วยการคัดลอก

### Claude Code

```bash
DEST=~/.claude/skills        # สำหรับขอบเขตโปรเจกต์ให้ใช้ .claude/skills
```

- คัดลอกหรือสร้างลิงก์ด้วยคำสั่งทั่วไป (เอกสารทางการระบุชัดเจนว่ารองรับลิงก์)
- การเปลี่ยนแปลงมีผลอัตโนมัติใน session ปัจจุบัน หากตอนเริ่มต้นยังไม่มี `~/.claude/skills` ให้รัน `/reload-skills`
- พิมพ์ `/skills` เพื่อดูสกิลที่โหลดแล้ว
- `~/.claude/skills` ใช้ได้กับ Claude Code บนเครื่องเท่านั้น ไม่มีผลกับ Cowork หรือ cloud session

### Claude (claude.ai เว็บ, เดสก์ท็อป)

ใช้ได้กับแพ็กเกจแบบชำระเงิน (Pro, Max, Team, Enterprise)

1. เปิดใช้งาน code execution: **Settings > Capabilities > Code execution and file creation** สำหรับ Team/Enterprise ต้องให้ Owner เปิดใช้งาน Skills และ code execution ใน **Organization settings > Plugins & skills**
2. แพ็กสกิลทั้งห้าตัวแยกเป็น ZIP ตัวละไฟล์ ระดับบนสุดภายใน ZIP ต้องเป็นโฟลเดอร์ของสกิลนั้นเอง (เช่น `palo-alto-architect/SKILL.md`) อย่าวาง `SKILL.md` ไว้ที่ root ของ ZIP โดยตรง

   ```bash
   mkdir -p dist && cd skills
   for s in */; do zip -r "../dist/${s%/}.zip" "${s%/}"; done
   cd .. && unzip -l dist/senior-network-engineer.zip   # ทุกรายการควรขึ้นต้นด้วย senior-network-engineer/
   ```

   ```powershell
   # บน Windows ให้ใช้ PowerShell 7 (pwsh); Compress-Archive ใน Windows PowerShell 5.1 อาจสร้างรูปแบบพาธที่เข้ากันไม่ได้
   New-Item -ItemType Directory -Path dist -Force | Out-Null
   Get-ChildItem ./skills -Directory | ForEach-Object {
       Compress-Archive -Path $_.FullName -DestinationPath "dist/$($_.Name).zip" -Force
   }
   ```

3. ไปที่ **Customize > Skills** เลือก **+** → **Create skill** → **Upload a skill** อัปโหลด ZIP ทั้งห้าไฟล์ทีละไฟล์ แล้วเปิดใช้งานทั้งหมด
4. อธิบายงานของคุณในบทสนทนาเพื่อให้เรียกใช้อัตโนมัติ หรือพิมพ์ `/` ในช่องป้อนข้อความเพื่อเลือกสกิล

**ข้อจำกัดความยาวของ description:** Claude Help Center ระบุว่า description จำกัดไว้ที่ 200 อักขระ (เอกสารนักพัฒนาของ claude.com และข้อกำหนด Agent Skills อนุญาตถึง 1,024 อักขระ) bundle นี้ยึดตามข้อจำกัด 200 อักขระซึ่งเข้มงวดกว่า โดย description ของทั้งห้าสกิลมีความยาว 161–177 อักขระ

**ทางเลือก: อัปโหลดทั้งห้าสกิลพร้อมกันในรูปแบบ plugin** (แพ็กเกจ Pro ขึ้นไป) Claude plugin ต้องมี manifest `.claude-plugin/plugin.json` ซึ่ง repository นี้ไม่ได้ใส่ไว้ ให้สร้างขึ้นตอนแพ็กไฟล์:

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

จากนั้นอัปโหลด `dist/senior-network-engineer-bundle.zip` ใน **Customize > Plugins**

### ChatGPT

**ChatGPT เดสก์ท็อป:** ใช้สกิลบนเครื่องร่วมกับ Codex เพียงติดตั้งลงใน `~/.agents/skills` ก็เพียงพอ (ดูหัวข้อถัดไป) พิมพ์ `@` ใน ChatGPT เพื่อเลือกสกิล

**ChatGPT เว็บ:** ใช้ได้เฉพาะแพ็กเกจ Business, Enterprise, Healthcare และ Edu และขึ้นอยู่กับการตั้งค่าของผู้ดูแล workspace

1. เลือก **Plugins** ในแถบด้านข้าง
2. ใน **Plugin Directory** เปิดแท็บ **Skills**
3. เลือก **Create** → **Upload from your computer** แล้วอัปโหลดสกิลทั้งห้าตัวทีละตัว ChatGPT จะสแกนไฟล์ที่อัปโหลดแต่ละไฟล์ก่อน ผลลัพธ์อาจแสดงเป็น "Needs Review" หรือ "Blocked"

เอกสารทางการของ OpenAI ไม่ได้ระบุรูปแบบไฟล์สำหรับอัปโหลด ให้ลองใช้ ZIP แยกรายสกิลจากหัวข้อก่อนหน้าก่อน หากระบบไม่รับ ให้ปรับตามคำแนะนำบนหน้าจออัปโหลด

### OpenAI Codex (CLI, IDE extension)

```bash
DEST=~/.agents/skills        # สำหรับขอบเขตโปรเจกต์ให้ใช้ .agents/skills ภายใน repository
```

- คัดลอกหรือสร้างลิงก์ด้วยคำสั่งทั่วไป (เอกสารทางการระบุชัดเจนว่ารองรับลิงก์)
- Codex ตรวจจับการเปลี่ยนแปลงของสกิลโดยอัตโนมัติ หากสกิลไม่ปรากฏให้รีสตาร์ต Codex
- เรียกใช้ด้วย `$senior-network-engineer` หรือรัน `/skills` เพื่อเลือก
- พาธเดิม `$CODEX_HOME/skills` (`~/.codex/skills` เมื่อไม่ได้ตั้งค่า `CODEX_HOME`) ถูกนำออกจากเอกสารทางการแล้ว แต่ Codex ยังคงโหลดพาธนี้ในฐานะพาธที่เลิกใช้ (deprecated) หากยังมีสำเนาของ bundle นี้หลงเหลืออยู่ที่นั่น สกิลชื่อเดียวกันจะแสดงซ้ำสองครั้ง ให้ลบการติดตั้งเก่าออก

### Google Antigravity (2.0, IDE, CLI)

```bash
DEST=~/.gemini/config/skills                # Antigravity 2.0 และ IDE (global)
DEST=~/.gemini/antigravity-cli/skills       # Antigravity CLI (global)
DEST=<root-ของโปรเจกต์>/.agents/skills       # ขอบเขตโปรเจกต์ที่ใช้ร่วมกันทั้งสามแบบ
```

- ทั้งสามอินเทอร์เฟซใช้พาธ global ต่างกัน หากใช้ทั้ง 2.0/IDE และ CLI ให้ติดตั้งลงในพาธ global ทั้งสองแห่ง หรือใช้ `.agents/skills` ระดับโปรเจกต์แทน
- IDE ยังคงรองรับพาธเดิม `~/.gemini/antigravity/skills`
- การย้ายจาก Gemini CLI: `~/.gemini/skills` เทียบเท่ากับ `~/.gemini/antigravity-cli/skills` ส่วน `.gemini/skills` ของโปรเจกต์ต้องเปลี่ยนชื่อหรือย้ายไปเป็น `.agents/skills` ด้วยตนเอง
- CLI ยังติดตั้งผ่าน plugin ได้ด้วย: สร้างโฟลเดอร์ที่มี `plugin.json` และ `skills/` แล้วรัน `agy plugin install <โฟลเดอร์-plugin>` จากนั้นพิมพ์ `/skills` ใน TUI เพื่อดูสกิลที่โหลดแล้ว

### Gemini CLI

Gemini CLI ยุติการให้บริการสำหรับผู้ใช้รายบุคคลตั้งแต่วันที่ 2026-06-18 (แทนที่ด้วย Antigravity CLI) มีเพียงไลเซนส์ Gemini Code Assist Standard/Enterprise และ Gemini API key แบบชำระเงินเท่านั้นที่ยังใช้งานต่อได้

```bash
DEST=~/.gemini/skills        # หรือ ~/.agents/skills; สำหรับขอบเขตโปรเจกต์ให้ใช้ .gemini/skills หรือ .agents/skills
```

- สามารถสร้างลิงก์ด้วยคำสั่งทางการได้เช่นกัน: `gemini skills link ./skills`
- รัน `/skills reload` ใน session เพื่อโหลดสกิลใหม่ และ `/skills list` เพื่อดูรายการ
- สิทธิ์เข้าถึงไฟล์ในโฟลเดอร์ของสกิลจะได้รับก็ต่อเมื่อสกิลนั้นถูกเปิดใช้งาน (activate) แล้วเท่านั้น จึงอาจมีข้อความขออนุญาตปรากฏขึ้นเมื่อสกิลหลักอ่าน subskill

### Cursor

```bash
DEST=~/.cursor/skills        # หรือ ~/.agents/skills; สำหรับขอบเขตโปรเจกต์ให้ใช้ .cursor/skills หรือ .agents/skills
```

- Cursor ค้นพบสกิลโดยอัตโนมัติเมื่อเริ่มทำงาน ดูรายการได้ที่ **Customize → Skills**
- เรียกใช้โดยพิมพ์ `/` ใน Agent chat แล้วเลือกสกิล
- เฉพาะ `~/.cursor/skills` เท่านั้นที่ซิงก์ไปยัง Cloud Agents (เปิด **Sync Skills for Cloud Agents** ใน **Settings → Agents**) ส่วน `~/.agents/skills` จะไม่ซิงก์ไปยัง Cloud Agents หรือ remote SSH

### GitHub Copilot (VS Code agent mode, Copilot CLI)

```bash
DEST=~/.copilot/skills       # หรือ ~/.agents/skills; สำหรับขอบเขตโปรเจกต์ให้ใช้ .github/skills หรือ .agents/skills
```

- หากไลเซนส์ Copilot ของคุณมาจากองค์กรหรือ enterprise ผู้ดูแลระบบต้องอนุญาตฟีเจอร์ที่เกี่ยวข้องใน policy
- VS Code: พิมพ์ `/skills` ใน Chat เพื่อเปิดการตั้งค่าสกิล Copilot CLI: `/skills list`, `/skills reload`
- Copilot cloud agent และ code review ทำงานบน GitHub และอ่านเฉพาะสกิลที่อยู่ภายใน repository (ขอบเขตโปรเจกต์) เท่านั้น

### Hermes Agent

```bash
DEST=~/.hermes/skills/network   # วางสกิลทั้งห้าตัวไว้ใต้โฟลเดอร์หมวดหมู่เดียวกัน
```

- สกิลใหม่จะมีผลใน session ใหม่ (หรือรัน `/reset`)
- `.hermes/skills` และ `.agents/skills` ของโปรเจกต์จะโหลดก็ต่อเมื่อคุณรัน `hermes skills trust` ใน repository นั้นแล้วเท่านั้น
- หากติดตั้งสกิลไว้ใน `~/.agents/skills` แล้ว ให้เพิ่มพาธนั้นลงใน `skills.external_dirs` ใน `~/.hermes/config.yaml` เพื่อใช้ร่วมกัน
- ไม่แนะนำให้ติดตั้งทีละตัวจาก GitHub ด้วย `hermes skills install` เพราะจะคัดลอกเฉพาะไฟล์ที่ `SKILL.md` อ้างอิงถึงโดยตรง ทำให้ไฟล์ที่อ้างอิงข้ามสกิลผ่าน `../` ไม่ถูกดาวน์โหลด

## การใช้งาน

อธิบายงานของคุณ แล้วเครื่องมือจะเลือกสกิลโดยอัตโนมัติตาม description หากต้องการเลือกเอง ให้เรียกใช้ตามวิธีที่แพลตฟอร์มของคุณรองรับ (ดูตารางอ้างอิงด่วน) ตัวอย่างเช่นใน Codex:

```text
$senior-network-engineer วิเคราะห์เหตุขัดข้องของเครือข่ายแบบข้ามผู้ผลิตนี้ โดยระบุหลักฐานและสมมติฐานก่อน จากนั้นจัดทำ MOP พร้อมแผน rollback กรุณาตอบเป็นภาษาไทย
```

สำหรับคำถามที่เกี่ยวกับผู้ผลิตรายเดียว สามารถเรียกใช้ subskill ได้โดยตรง เช่น `palo-alto-architect`, `fortinet-security-fabric-architect`, `cisco-network-dc-architect` หรือ `hpe-aruba-network-architect`

## การอัปเดต

บนคอมพิวเตอร์ที่คุณทำการแก้ไข:

```bash
git status --short
git add -- <ไฟล์ที่คุณแก้ไขจริง>
git commit -m "<คำอธิบายที่มีจุดประสงค์เดียว>"
git push
```

บนคอมพิวเตอร์เครื่องอื่น:

```bash
git pull --ff-only
```

- เครื่องมือที่ติดตั้งด้วยลิงก์: การเปลี่ยนแปลงมีผลทันทีหลัง pull
- เครื่องมือที่ติดตั้งด้วยการคัดลอก: รันคำสั่งคัดลอกอีกครั้งหลัง pull
- แพลตฟอร์มแบบอัปโหลด (Claude, ChatGPT เว็บ): แพ็กและอัปโหลดสกิลที่มีการเปลี่ยนแปลงใหม่อีกครั้ง

## ข้อมูลที่ขึ้นกับเวลา

- เวอร์ชัน, EoL/EoS, CVE, Recommended Releases, การรองรับ PQC และความสามารถของเครื่องมือ AI อ้างอิงจากเอกสารของผู้ผลิตหรือเอกสารทางการ โดยระบุวันที่ตรวจสอบไว้ในเนื้อหา
- พาธของสกิลและขั้นตอนการอัปโหลดของเครื่องมือ AI เปลี่ยนแปลงบ่อย เอกสารนี้สะท้อนเอกสารทางการ ณ วันที่ 2026-09-27 หากสกิลไม่โหลดหลังติดตั้ง ให้ตรวจสอบเอกสารล่าสุดของเครื่องมือนั้นก่อน
- ณ เวลาที่ตรวจสอบ รายการต่อไปนี้พบได้เฉพาะในแหล่งข้อมูลของบุคคลที่สามหรือชุมชน เนื่องจากหน้าเอกสารทางการต้องเข้าสู่ระบบ support portal ของผู้ผลิต เนื้อหาในสกิลจึงระบุไว้ว่า "ตรวจสอบซ้ำก่อนอ้างอิง":
  - วันที่ EoS ของ FortiNAC 9.4 และ End of Order ของ FortiGate CNF (Fortinet Product Life Cycle ต้องใช้บัญชี FortiCare)
  - EoS ของซอฟต์แวร์ AirWave และสถานะการยุติการขายของ 2930F/2930M/5400R (HPE Networking Support Portal)
- เมื่ออัปเดตเนื้อหาที่ขึ้นกับเวลา ให้อัปเดตวันที่ตรวจสอบในหัวข้อที่เกี่ยวข้องและ `version` ใน `bundle-manifest.json` ด้วย

## กฎการดูแลรักษา

- แก้ไขสกิลฉบับหลักภายใน `skills/` เท่านั้น อย่าแก้ไขสำเนาที่อยู่ในตำแหน่งติดตั้ง
- เก็บสกิลทั้งห้าตัวไว้ในระดับเดียวกัน ให้ `SKILL.md` กระชับและไม่เกิน 500 บรรทัด โดยย้ายรายละเอียดไปไว้ใน `references/` ที่ลึกเพียงหนึ่งระดับ
- `name` ใน frontmatter ต้องตรงกับชื่อโฟลเดอร์ `description` ต้องไม่เกิน 200 อักขระ (เพื่อให้ผ่านข้อจำกัดการอัปโหลดของ Claude Help Center) และต้องระบุทั้งสิ่งที่สกิลทำและเงื่อนไขที่ควรเรียกใช้
- อย่ากล่าวอ้างข้อมูล CVE, fixed release, EoL, PQC, CLI, ไลเซนส์ หรือฟีเจอร์ของแพลตฟอร์ม AI จากความจำ ให้อ้างอิงเอกสารของผู้ผลิตหรือเอกสารทางการ และบันทึกวันที่ตรวจสอบ
- ห้าม commit คอนฟิกของลูกค้า, PCAP, บัญชีผู้ใช้, รหัสผ่าน, PSK, private key, API token, ไลเซนส์ หรือไฟล์แนบของ ticket
- คำแนะนำที่มีความเสี่ยงสูงต้องระบุหลักฐาน, blast radius, เงื่อนไขการหยุด (stop conditions), rollback และการตรวจสอบความถูกต้อง (validation)
- `README.md` (ภาษาจีนตัวเต็ม) คือ README ฉบับหลัก เมื่อแก้ไขไฟล์นี้ ให้อัปเดตฉบับแปล `README/README.<lang>.md` ทุกฉบับใน commit เดียวกัน
