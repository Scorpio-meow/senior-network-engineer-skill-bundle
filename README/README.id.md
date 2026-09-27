# Senior Network Engineer Skill Bundle

[繁體中文](../README.md) | [English](README.en.md) | [简体中文](README.zh-CN.md) | [粵語](README.yue.md) | [日本語](README.ja.md) | [한국어](README.ko.md) | [Español](README.es.md) | [Português (Brasil)](README.pt-BR.md) | [Français](README.fr.md) | [Deutsch](README.de.md) | [Русский](README.ru.md) | [Tiếng Việt](README.vi.md) | **Bahasa Indonesia** | [ไทย](README.th.md) | [Türkçe](README.tr.md) | [العربية](README.ar.md)

Bundle skill pribadi untuk senior network engineer: satu skill utama lintas vendor ditambah empat subskill vendor, disimpan dalam satu repository Git agar beberapa komputer dan tool AI berbagi satu sumber kebenaran (source of truth).

Skill-skill ini mengikuti [format terbuka Agent Skills](https://agentskills.io/specification) (setiap folder berisi `SKILL.md` dan `references/` opsional) dan dapat diinstal ke Claude, ChatGPT/Codex, Google Antigravity, Gemini CLI, Cursor, GitHub Copilot, serta tool lain yang mendukung format tersebut.

Konten yang sensitif terhadap waktu (versi, EoL, CVE, PQC, kapabilitas tool AI, dan path instalasi) telah diverifikasi per **2026-09-27**.

> **Catatan bahasa:** Konten skill ditulis dalam bahasa Mandarin Tradisional dan secara default menginstruksikan AI untuk menjawab dalam bahasa Mandarin Tradisional dengan terminologi TI perusahaan Taiwan. Jika Anda memerlukan jawaban dalam bahasa lain, nyatakan secara eksplisit dalam permintaan Anda.

## Daftar Isi

- [Skill yang disertakan](#skill-yang-disertakan)
- [Struktur direktori](#struktur-direktori)
- [Sebelum instalasi](#sebelum-instalasi)
- [Perintah instalasi umum](#perintah-instalasi-umum)
- [Instalasi per platform](#instalasi-per-platform)
- [Penggunaan](#penggunaan)
- [Pembaruan](#pembaruan)
- [Informasi yang sensitif terhadap waktu](#informasi-yang-sensitif-terhadap-waktu)
- [Aturan pemeliharaan](#aturan-pemeliharaan)

## Skill yang disertakan

| Skill | Cakupan |
|---|---|
| `senior-network-engineer` | Skill utama. Arsitektur dan troubleshooting lintas vendor, analisis paket/session, HA/DR, tata kelola CVE dan versi, PQC, fondasi keamanan CEH/CISSP, tata kelola AI Agent/MCP, komunikasi dengan pelanggan dan vendor, HLD/LLD/MOP/RCA serta pelatihan; meneruskan pertanyaan ke subskill di bawah ini |
| `palo-alto-architect` | PAN-OS NGFW, Panorama, Strata Cloud Manager, Prisma SASE, Cortex (XDR/XSIAM/XSOAR/AgentiX/Cortex Cloud), CVE, dan PQC |
| `fortinet-security-fabric-architect` | FortiGate/FortiOS, FortiManager, FortiAnalyzer, SD-WAN, ZTNA, migrasi SSL VPN ke IPsec, PSIRT, dan PQC/QKD |
| `cisco-network-dc-architect` | Catalyst, Nexus/Nexus Dashboard, ACI, VXLAN EVPN, Catalyst SD-WAN, WLC 9800/CW9800, ISE, Secure Firewall, PSIRT, dan PQC/MACsec |
| `hpe-aruba-network-architect` | AOS-8/AOS-10, Instant AOS-8, HPE Aruba Networking Central, ClearPass, AOS-CX/AOS-Switch, HPE Security Bulletins, dan PPK/PQC |

## Struktur direktori

```text
.
├── README.md                             # Bahasa Mandarin Tradisional (kanonis)
├── README/                               # Terjemahan (15 bahasa)
│   └── README.<lang>.md
├── bundle-manifest.json                  # Nama bundle, versi, dan daftar skill
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

## Sebelum instalasi

1. **Instal kelima skill ke folder yang sama.** Skill utama memuat subskill melalui path relatif `../<subskill>/SKILL.md`, yang hanya dapat di-resolve jika kelima folder berada berdampingan.
2. **Jangan mengganti nama folder.** Sebagian besar tool mewajibkan nama folder sama dengan `name` di `SKILL.md` dan dapat melewati skill secara diam-diam jika keduanya berbeda.
3. **Pada platform berbasis unggahan (Claude web/desktop, ChatGPT web), unggah dan aktifkan kelimanya.** Di platform ini setiap skill berdiri sendiri. Anthropic Help Center menyatakan bahwa skill tidak dapat mereferensikan skill lain secara eksplisit, tetapi Claude secara otomatis menggabungkan beberapa skill bila sesuai.
4. **Instal sekali, gunakan bersama di berbagai tool.** `~/.agents/skills` adalah lokasi lintas tool yang dibaca oleh Codex/ChatGPT desktop, Cursor, GitHub Copilot, dan Gemini CLI; Claude Code dan Antigravity memerlukan direktorinya sendiri.

## Perintah instalasi umum

Clone repository ini terlebih dahulu, lalu jalankan perintah dari root repository. Ganti `$dest` / `DEST` dengan path untuk platform Anda dari tabel di bagian berikutnya.

**Windows (PowerShell)**

```powershell
git clone https://github.com/Scorpio-meow/senior-network-engineer-skill-bundle.git
Set-Location senior-network-engineer-skill-bundle

$dest = Join-Path $HOME '.agents/skills'      # Ganti sesuai platform
New-Item -ItemType Directory -Path $dest -Force | Out-Null

# Opsi 1: Salin (kompatibilitas terbaik; salin ulang setiap kali ada pembaruan)
Copy-Item ./skills/* $dest -Recurse -Force

# Opsi 2: Junction (perubahan di repository langsung berlaku; hanya untuk tool yang secara resmi mendukung link)
Get-ChildItem ./skills -Directory | ForEach-Object {
    New-Item -ItemType Junction -Path (Join-Path $dest $_.Name) -Target $_.FullName
}
```

**macOS / Linux**

```bash
git clone https://github.com/Scorpio-meow/senior-network-engineer-skill-bundle.git
cd senior-network-engineer-skill-bundle

DEST=~/.agents/skills        # Ganti sesuai platform
mkdir -p "$DEST"

# Opsi 1: Salin
cp -R skills/* "$DEST/"

# Opsi 2: Symlink (hanya untuk tool yang secara resmi mendukung link)
for d in "$PWD"/skills/*/; do ln -s "${d%/}" "$DEST/"; done
```

Pembuatan link akan gagal jika folder dengan nama yang sama sudah ada di tujuan; cadangkan atau hapus versi lama secara manual terlebih dahulu.

## Instalasi per platform

### Referensi cepat

| Platform | Path pribadi (global) | Path proyek | Dukungan link | Pemanggilan manual |
|---|---|---|---|---|
| Claude Code | `~/.claude/skills` | `.claude/skills` | Ya | `/senior-network-engineer` |
| Claude web/desktop | Unggah ZIP (lihat di bawah) | — | — | Ketik `/` lalu pilih |
| ChatGPT desktop, Codex CLI/IDE | `~/.agents/skills` | `.agents/skills` | Ya | ChatGPT: `@`; Codex: `$senior-network-engineer` atau `/skills` |
| ChatGPT web | Unggah (lihat di bawah) | — | — | Otomatis atau `@` |
| Antigravity 2.0 / IDE | `~/.gemini/config/skills` | `.agents/skills` | Tidak didokumentasikan | `/senior-network-engineer` |
| Antigravity CLI | `~/.gemini/antigravity-cli/skills` | `.agents/skills` | Tidak didokumentasikan | `/senior-network-engineer` |
| Gemini CLI | `~/.gemini/skills` atau `~/.agents/skills` | `.gemini/skills` atau `.agents/skills` | Ya | Otomatis (`/skills list` untuk melihat) |
| Cursor | `~/.cursor/skills` atau `~/.agents/skills` | `.cursor/skills` atau `.agents/skills` | Tidak didokumentasikan | Ketik `/` di Agent chat |
| GitHub Copilot (VS Code, CLI) | `~/.copilot/skills` atau `~/.agents/skills` | `.github/skills` atau `.agents/skills` | Tidak didokumentasikan | `/senior-network-engineer` |
| Hermes Agent | `~/.hermes/skills/<kategori>` | `.hermes/skills` atau `.agents/skills` | Tidak didokumentasikan | `/senior-network-engineer` |

Setiap tool juga memuat skill secara otomatis jika deskripsinya cocok dengan tugas. Untuk tool yang ditandai "Tidak didokumentasikan", dokumentasi resmi tidak menyebutkan apakah link didukung; lakukan instalasi dengan cara menyalin.

### Claude Code

```bash
DEST=~/.claude/skills        # Untuk cakupan proyek gunakan .claude/skills
```

- Salin atau buat link menggunakan perintah umum (link didukung secara eksplisit dalam dokumentasi resmi).
- Perubahan berlaku otomatis pada session saat ini; jika `~/.claude/skills` belum ada saat startup, jalankan `/reload-skills`.
- Ketik `/skills` untuk melihat skill yang telah dimuat.
- `~/.claude/skills` hanya berlaku untuk Claude Code lokal, tidak untuk Cowork maupun session cloud.

### Claude (claude.ai web, desktop)

Tersedia pada paket berbayar (Pro, Max, Team, Enterprise).

1. Aktifkan eksekusi kode: **Settings > Capabilities > Code execution and file creation**. Pada Team/Enterprise, seorang Owner harus mengaktifkan Skills dan eksekusi kode di **Organization settings > Plugins & skills**.
2. Kemas masing-masing dari kelima skill sebagai ZIP tersendiri. Tingkat teratas di dalam ZIP harus berupa folder skill itu sendiri (misalnya `palo-alto-architect/SKILL.md`); jangan letakkan `SKILL.md` langsung di root ZIP.

   ```bash
   mkdir -p dist && cd skills
   for s in */; do zip -r "../dist/${s%/}.zip" "${s%/}"; done
   cd .. && unzip -l dist/senior-network-engineer.zip   # Setiap entri harus diawali dengan senior-network-engineer/
   ```

   ```powershell
   # Di Windows gunakan PowerShell 7 (pwsh); Compress-Archive di Windows PowerShell 5.1 dapat menghasilkan format path yang tidak kompatibel
   New-Item -ItemType Directory -Path dist -Force | Out-Null
   Get-ChildItem ./skills -Directory | ForEach-Object {
       Compress-Archive -Path $_.FullName -DestinationPath "dist/$($_.Name).zip" -Force
   }
   ```

3. Buka **Customize > Skills**, pilih **+** → **Create skill** → **Upload a skill**, unggah kelima ZIP satu per satu, lalu aktifkan semuanya.
4. Jelaskan tugas Anda dalam percakapan agar skill digunakan secara otomatis, atau ketik `/` di kotak input untuk memilih skill.

**Batas panjang deskripsi:** Claude Help Center menyatakan batas 200 karakter untuk deskripsi (dokumentasi developer claude.com dan spesifikasi Agent Skills mengizinkan 1.024 karakter). Bundle ini mengikuti batas 200 karakter yang lebih ketat; kelima deskripsi masing-masing sepanjang 161–177 karakter.

**Alternatif: unggah kelima skill sekaligus sebagai plugin** (paket Pro atau lebih tinggi). Plugin Claude memerlukan manifest `.claude-plugin/plugin.json`, yang tidak disertakan dalam repository ini; buat manifest tersebut saat pengemasan:

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

Kemudian unggah `dist/senior-network-engineer-bundle.zip` di **Customize > Plugins**.

### ChatGPT

**ChatGPT desktop:** Berbagi skill lokal dengan Codex; cukup instal ke `~/.agents/skills` (lihat bagian berikutnya). Ketik `@` di ChatGPT untuk memilih skill.

**ChatGPT web:** Terbatas pada paket Business, Enterprise, Healthcare, dan Edu, serta bergantung pada pengaturan admin workspace.

1. Pilih **Plugins** di sidebar.
2. Di **Plugin Directory**, buka tab **Skills**.
3. Pilih **Create** → **Upload from your computer** dan unggah kelima skill satu per satu. ChatGPT memindai setiap unggahan terlebih dahulu; hasilnya dapat menampilkan "Needs Review" atau "Blocked".

Dokumentasi resmi OpenAI tidak menyebutkan format file unggahan. Coba terlebih dahulu ZIP per skill dari bagian sebelumnya; jika tidak diterima, sesuaikan dengan petunjuk di layar unggahan.

### OpenAI Codex (CLI, ekstensi IDE)

```bash
DEST=~/.agents/skills        # Untuk cakupan proyek gunakan .agents/skills di dalam repository
```

- Salin atau buat link menggunakan perintah umum (link didukung secara eksplisit dalam dokumentasi resmi).
- Codex mendeteksi perubahan skill secara otomatis; restart Codex jika perubahan tidak muncul.
- Panggil dengan `$senior-network-engineer`, atau jalankan `/skills` untuk memilih.
- Path lama `$CODEX_HOME/skills` (`~/.codex/skills` jika `CODEX_HOME` tidak diatur) telah dihapus dari dokumentasi resmi, tetapi Codex masih memuatnya sebagai path deprecated. Jika salinan lain dari bundle ini masih ada di sana, skill dengan nama yang sama akan muncul dua kali; hapus instalasi lama tersebut.

### Google Antigravity (2.0, IDE, CLI)

```bash
DEST=~/.gemini/config/skills                # Antigravity 2.0 dan IDE (global)
DEST=~/.gemini/antigravity-cli/skills       # Antigravity CLI (global)
DEST=<root-proyek>/.agents/skills           # Cakupan proyek yang digunakan bersama oleh ketiganya
```

- Ketiga antarmuka menggunakan path global yang berbeda. Jika Anda menggunakan 2.0/IDE sekaligus CLI, instal ke kedua path global tersebut, atau gunakan `.agents/skills` dengan cakupan proyek sebagai gantinya.
- IDE masih mendukung path lama `~/.gemini/antigravity/skills`.
- Migrasi dari Gemini CLI: `~/.gemini/skills` dipetakan ke `~/.gemini/antigravity-cli/skills`; `.gemini/skills` milik proyek harus diganti namanya atau dipindahkan ke `.agents/skills` secara manual.
- CLI juga dapat melakukan instalasi melalui plugin: buat folder yang berisi `plugin.json` dan `skills/`, lalu jalankan `agy plugin install <folder-plugin>`; ketik `/skills` di TUI untuk melihat skill yang telah dimuat.

### Gemini CLI

Gemini CLI berhenti melayani pengguna individu pada 2026-06-18 (digantikan oleh Antigravity CLI). Hanya lisensi Gemini Code Assist Standard/Enterprise dan API key Gemini berbayar yang masih dapat menggunakannya.

```bash
DEST=~/.gemini/skills        # Atau ~/.agents/skills; untuk cakupan proyek gunakan .gemini/skills atau .agents/skills
```

- Anda juga dapat membuat link dengan perintah resmi: `gemini skills link ./skills`.
- Jalankan `/skills reload` dalam session untuk memuat skill baru, dan `/skills list` untuk melihatnya.
- Akses file ke folder skill hanya diberikan ketika skill diaktifkan; Anda mungkin melihat prompt izin ketika skill utama membaca subskill.

### Cursor

```bash
DEST=~/.cursor/skills        # Atau ~/.agents/skills; untuk cakupan proyek gunakan .cursor/skills atau .agents/skills
```

- Cursor menemukan skill secara otomatis saat startup; lihat di **Customize → Skills**.
- Panggil dengan mengetik `/` di Agent chat lalu memilih skill.
- Hanya `~/.cursor/skills` yang disinkronkan ke Cloud Agents (aktifkan **Sync Skills for Cloud Agents** di **Settings → Agents**); `~/.agents/skills` tidak disinkronkan ke Cloud Agents maupun remote SSH.

### GitHub Copilot (mode agent VS Code, Copilot CLI)

```bash
DEST=~/.copilot/skills       # Atau ~/.agents/skills; untuk cakupan proyek gunakan .github/skills atau .agents/skills
```

- Jika lisensi Copilot Anda berasal dari organisasi atau enterprise, admin harus mengizinkan fitur terkait melalui policy.
- VS Code: ketik `/skills` di Chat untuk membuka pengaturan skill. Copilot CLI: `/skills list`, `/skills reload`.
- Copilot cloud agent dan code review berjalan di GitHub dan hanya membaca skill di dalam repository (cakupan proyek).

### Hermes Agent

```bash
DEST=~/.hermes/skills/network   # Letakkan kelima skill di bawah folder kategori yang sama
```

- Skill baru berlaku pada session baru (atau jalankan `/reset`).
- `.hermes/skills` dan `.agents/skills` milik proyek baru dimuat setelah Anda menjalankan `hermes skills trust` di repository tersebut.
- Jika skill sudah terinstal di `~/.agents/skills`, tambahkan path tersebut ke `skills.external_dirs` di `~/.hermes/config.yaml` untuk menggunakannya bersama.
- Instalasi satu per satu dari GitHub dengan `hermes skills install` tidak disarankan: perintah ini hanya menyalin file yang direferensikan langsung oleh `SKILL.md`, sehingga referensi `../` lintas skill tidak ikut diunduh.

## Penggunaan

Jelaskan tugas Anda, dan tool akan memilih skill secara otomatis berdasarkan deskripsinya. Untuk memilih secara eksplisit, panggil skill sesuai cara yang didukung platform Anda (lihat tabel referensi cepat). Contohnya, di Codex:

```text
$senior-network-engineer Analisis insiden jaringan lintas vendor ini. Uraikan bukti dan hipotesis terlebih dahulu, lalu berikan MOP beserta rencana rollback. Mohon jawab dalam bahasa Indonesia.
```

Untuk pertanyaan yang hanya melibatkan satu vendor, Anda dapat memanggil subskill secara langsung, seperti `palo-alto-architect`, `fortinet-security-fabric-architect`, `cisco-network-dc-architect`, atau `hpe-aruba-network-architect`.

## Pembaruan

Di komputer tempat Anda melakukan perubahan:

```bash
git status --short
git add -- <file-yang-benar-benar-diubah>
git commit -m "<deskripsi dengan satu tujuan>"
git push
```

Di komputer lain:

```bash
git pull --ff-only
```

- Tool yang diinstal melalui link: perubahan langsung berlaku setelah pull.
- Tool yang diinstal dengan cara menyalin: jalankan ulang perintah salin setelah pull.
- Platform berbasis unggahan (Claude, ChatGPT web): kemas ulang dan unggah ulang skill yang berubah.

## Informasi yang sensitif terhadap waktu

- Versi, EoL/EoS, CVE, Recommended Releases, dukungan PQC, dan kapabilitas tool AI didasarkan pada dokumentasi vendor atau dokumentasi resmi, dengan tanggal verifikasi dicantumkan dalam teks.
- Path skill dan alur unggahan untuk tool AI sering berubah. Dokumen ini mencerminkan dokumentasi resmi per 2026-09-27; jika skill tidak termuat setelah instalasi, periksa terlebih dahulu dokumentasi terbaru tool tersebut.
- Pada saat verifikasi, item berikut hanya dapat ditemukan di sumber pihak ketiga atau komunitas karena halaman resminya memerlukan login ke portal dukungan vendor. Konten skill menandainya dengan "verifikasi ulang sebelum mengutip":
  - Tanggal EoS FortiNAC 9.4 dan End of Order FortiGate CNF (Fortinet Product Life Cycle, memerlukan akun FortiCare)
  - EoS perangkat lunak AirWave dan status end-of-sale 2930F/2930M/5400R (HPE Networking Support Portal)
- Saat memperbarui konten yang sensitif terhadap waktu, perbarui juga tanggal verifikasi di bagian terkait dan `version` di `bundle-manifest.json`.

## Aturan pemeliharaan

- Edit skill kanonis hanya di dalam `skills/`; jangan mengedit salinan di lokasi instalasi.
- Pertahankan kelima skill pada tingkat yang sama; buat `SKILL.md` tetap ringkas dan di bawah 500 baris, dengan detail ditempatkan di `references/` sedalam satu tingkat.
- `name` pada frontmatter harus sama dengan nama folder; `description` maksimal 200 karakter (agar sesuai dengan batas unggahan Claude Help Center) dan harus menyatakan apa yang dilakukan skill serta kapan skill dipicu.
- Jangan mengklaim CVE, fixed release, EoL, PQC, CLI, lisensi, atau fitur platform AI berdasarkan ingatan; andalkan dokumentasi vendor atau dokumentasi resmi dan catat tanggal verifikasinya.
- Jangan melakukan commit konfigurasi pelanggan, PCAP, akun, password, PSK, private key, API token, lisensi, atau lampiran tiket.
- Rekomendasi berisiko tinggi harus menyertakan bukti, blast radius, kondisi penghentian (stop conditions), rollback, dan validasi.
- `README.md` (bahasa Mandarin Tradisional) adalah README kanonis. Saat mengubahnya, perbarui setiap terjemahan `README/README.<lang>.md` dalam commit yang sama.
