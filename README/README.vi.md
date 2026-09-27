# Senior Network Engineer Skill Bundle

[繁體中文](../README.md) | [English](README.en.md) | [简体中文](README.zh-CN.md) | [粵語](README.yue.md) | [日本語](README.ja.md) | [한국어](README.ko.md) | [Español](README.es.md) | [Português (Brasil)](README.pt-BR.md) | [Français](README.fr.md) | [Deutsch](README.de.md) | [Русский](README.ru.md) | **Tiếng Việt** | [Bahasa Indonesia](README.id.md) | [ไทย](README.th.md) | [Türkçe](README.tr.md) | [العربية](README.ar.md)

Bộ skill cá nhân dành cho kỹ sư mạng cấp cao: một skill chính đa hãng cùng bốn subskill theo từng hãng, được lưu trong một Git repository duy nhất để nhiều máy tính và công cụ AI dùng chung một nguồn dữ liệu chuẩn (single source of truth).

Các skill tuân theo [định dạng mở Agent Skills](https://agentskills.io/specification) (mỗi thư mục chứa `SKILL.md` và thư mục `references/` tùy chọn) và có thể cài vào Claude, ChatGPT/Codex, Google Antigravity, Gemini CLI, Cursor, GitHub Copilot cùng các công cụ khác hỗ trợ định dạng này.

Nội dung có tính thời điểm (phiên bản, EoL, CVE, PQC, khả năng và đường dẫn cài đặt của công cụ AI) được xác minh tính đến ngày **2026-09-27**.

> **Lưu ý về ngôn ngữ:** Nội dung skill được viết bằng tiếng Trung phồn thể và mặc định yêu cầu AI trả lời bằng tiếng Trung phồn thể với thuật ngữ IT doanh nghiệp Đài Loan. Nếu cần câu trả lời bằng ngôn ngữ khác, hãy nêu rõ ngôn ngữ đó trong yêu cầu của bạn.

## Mục lục

- [Các skill đi kèm](#các-skill-đi-kèm)
- [Cấu trúc thư mục](#cấu-trúc-thư-mục)
- [Trước khi cài đặt](#trước-khi-cài-đặt)
- [Lệnh cài đặt chung](#lệnh-cài-đặt-chung)
- [Cài đặt theo từng nền tảng](#cài-đặt-theo-từng-nền-tảng)
- [Cách sử dụng](#cách-sử-dụng)
- [Cập nhật](#cập-nhật)
- [Thông tin có tính thời điểm](#thông-tin-có-tính-thời-điểm)
- [Quy tắc bảo trì](#quy-tắc-bảo-trì)

## Các skill đi kèm

| Skill | Phạm vi |
|---|---|
| `senior-network-engineer` | Skill chính. Kiến trúc và xử lý sự cố đa hãng, phân tích packet/session, HA/DR, quản trị CVE và phiên bản, PQC, nền tảng bảo mật CEH/CISSP, quản trị AI Agent/MCP, giao tiếp với khách hàng và hãng, HLD/LLD/MOP/RCA và đào tạo; điều hướng câu hỏi đến các subskill bên dưới |
| `palo-alto-architect` | PAN-OS NGFW, Panorama, Strata Cloud Manager, Prisma SASE, Cortex (XDR/XSIAM/XSOAR/AgentiX/Cortex Cloud), CVE và PQC |
| `fortinet-security-fabric-architect` | FortiGate/FortiOS, FortiManager, FortiAnalyzer, SD-WAN, ZTNA, chuyển đổi từ SSL VPN sang IPsec, PSIRT và PQC/QKD |
| `cisco-network-dc-architect` | Catalyst, Nexus/Nexus Dashboard, ACI, VXLAN EVPN, Catalyst SD-WAN, 9800/CW9800 WLC, ISE, Secure Firewall, PSIRT và PQC/MACsec |
| `hpe-aruba-network-architect` | AOS-8/AOS-10, Instant AOS-8, HPE Aruba Networking Central, ClearPass, AOS-CX/AOS-Switch, HPE Security Bulletins và PPK/PQC |

## Cấu trúc thư mục

```text
.
├── README.md                             # Tiếng Trung phồn thể (bản chuẩn)
├── README/                               # Bản dịch (15 ngôn ngữ)
│   └── README.<lang>.md
├── bundle-manifest.json                  # Tên bundle, phiên bản và danh sách skill
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

## Trước khi cài đặt

1. **Cài cả năm skill vào cùng một thư mục.** Skill chính tải các subskill qua đường dẫn tương đối `../<subskill>/SKILL.md`, đường dẫn này chỉ phân giải được khi năm thư mục nằm cạnh nhau.
2. **Không đổi tên thư mục.** Phần lớn công cụ yêu cầu tên thư mục khớp với `name` trong `SKILL.md` và có thể âm thầm bỏ qua skill khi hai giá trị này khác nhau.
3. **Trên các nền tảng dạng tải lên (Claude web/desktop, ChatGPT web), hãy tải lên và bật cả năm skill.** Trên các nền tảng này, mỗi skill hoạt động độc lập. Anthropic Help Center cho biết skill không thể tham chiếu tường minh đến skill khác, nhưng Claude sẽ tự động kết hợp nhiều skill khi phù hợp.
4. **Cài một lần, dùng chung cho nhiều công cụ.** `~/.agents/skills` là vị trí dùng chung giữa các công cụ, được Codex/ChatGPT desktop, Cursor, GitHub Copilot và Gemini CLI đọc; Claude Code và Antigravity cần thư mục riêng.

## Lệnh cài đặt chung

Trước tiên hãy clone repository này, sau đó chạy các lệnh từ thư mục gốc của repository. Thay `$dest` / `DEST` bằng đường dẫn của nền tảng bạn dùng, lấy từ bảng ở phần tiếp theo.

**Windows (PowerShell)**

```powershell
git clone https://github.com/Scorpio-meow/senior-network-engineer-skill-bundle.git
Set-Location senior-network-engineer-skill-bundle

$dest = Join-Path $HOME '.agents/skills'      # Thay theo từng nền tảng
New-Item -ItemType Directory -Path $dest -Force | Out-Null

# Cách 1: Sao chép (tương thích tốt nhất; cần sao chép lại sau mỗi lần cập nhật)
Copy-Item ./skills/* $dest -Recurse -Force

# Cách 2: Junction (chỉnh sửa trong repository có hiệu lực ngay; chỉ dùng cho công cụ chính thức hỗ trợ liên kết)
Get-ChildItem ./skills -Directory | ForEach-Object {
    New-Item -ItemType Junction -Path (Join-Path $dest $_.Name) -Target $_.FullName
}
```

**macOS / Linux**

```bash
git clone https://github.com/Scorpio-meow/senior-network-engineer-skill-bundle.git
cd senior-network-engineer-skill-bundle

DEST=~/.agents/skills        # Thay theo từng nền tảng
mkdir -p "$DEST"

# Cách 1: Sao chép
cp -R skills/* "$DEST/"

# Cách 2: Symlink (chỉ dùng cho công cụ chính thức hỗ trợ liên kết)
for d in "$PWD"/skills/*/; do ln -s "${d%/}" "$DEST/"; done
```

Việc tạo liên kết sẽ thất bại nếu tại đích đã tồn tại thư mục cùng tên; hãy tự sao lưu hoặc xóa phiên bản cũ trước.

## Cài đặt theo từng nền tảng

### Tra cứu nhanh

| Nền tảng | Đường dẫn cá nhân (global) | Đường dẫn dự án | Hỗ trợ liên kết | Gọi thủ công |
|---|---|---|---|---|
| Claude Code | `~/.claude/skills` | `.claude/skills` | Có | `/senior-network-engineer` |
| Claude web/desktop | Tải lên ZIP (xem bên dưới) | — | — | Gõ `/` rồi chọn |
| ChatGPT desktop, Codex CLI/IDE | `~/.agents/skills` | `.agents/skills` | Có | ChatGPT: `@`; Codex: `$senior-network-engineer` hoặc `/skills` |
| ChatGPT web | Tải lên (xem bên dưới) | — | — | Tự động hoặc `@` |
| Antigravity 2.0 / IDE | `~/.gemini/config/skills` | `.agents/skills` | Không nêu trong tài liệu | `/senior-network-engineer` |
| Antigravity CLI | `~/.gemini/antigravity-cli/skills` | `.agents/skills` | Không nêu trong tài liệu | `/senior-network-engineer` |
| Gemini CLI | `~/.gemini/skills` hoặc `~/.agents/skills` | `.gemini/skills` hoặc `.agents/skills` | Có | Tự động (xem bằng `/skills list`) |
| Cursor | `~/.cursor/skills` hoặc `~/.agents/skills` | `.cursor/skills` hoặc `.agents/skills` | Không nêu trong tài liệu | Gõ `/` trong Agent chat |
| GitHub Copilot (VS Code, CLI) | `~/.copilot/skills` hoặc `~/.agents/skills` | `.github/skills` hoặc `.agents/skills` | Không nêu trong tài liệu | `/senior-network-engineer` |
| Hermes Agent | `~/.hermes/skills/<danh-mục>` | `.hermes/skills` hoặc `.agents/skills` | Không nêu trong tài liệu | `/senior-network-engineer` |

Mọi công cụ cũng tự động tải skill khi phần mô tả của skill khớp với tác vụ. Với các công cụ được đánh dấu "Không nêu trong tài liệu", tài liệu chính thức không cho biết có hỗ trợ liên kết hay không; hãy cài đặt bằng cách sao chép.

### Claude Code

```bash
DEST=~/.claude/skills        # Với phạm vi dự án, dùng .claude/skills
```

- Sao chép hoặc tạo liên kết bằng các lệnh chung (tài liệu chính thức nêu rõ có hỗ trợ liên kết).
- Thay đổi tự động có hiệu lực trong session hiện tại; nếu `~/.claude/skills` chưa tồn tại lúc khởi động, hãy chạy `/reload-skills`.
- Gõ `/skills` để xem các skill đã được tải.
- `~/.claude/skills` chỉ áp dụng cho Claude Code cục bộ, không áp dụng cho Cowork hay các session trên cloud.

### Claude (claude.ai web, desktop)

Khả dụng trên các gói trả phí (Pro, Max, Team, Enterprise).

1. Bật thực thi mã: **Settings > Capabilities > Code execution and file creation**. Với Team/Enterprise, Owner phải bật Skills và thực thi mã trong **Organization settings > Plugins & skills**.
2. Đóng gói từng skill trong năm skill thành một tệp ZIP riêng. Cấp trên cùng bên trong ZIP phải là chính thư mục skill (ví dụ `palo-alto-architect/SKILL.md`); không đặt `SKILL.md` trực tiếp tại gốc của ZIP.

   ```bash
   mkdir -p dist && cd skills
   for s in */; do zip -r "../dist/${s%/}.zip" "${s%/}"; done
   cd .. && unzip -l dist/senior-network-engineer.zip   # Mọi mục đều phải bắt đầu bằng senior-network-engineer/
   ```

   ```powershell
   # Trên Windows hãy dùng PowerShell 7 (pwsh); Compress-Archive trong Windows PowerShell 5.1 có thể tạo định dạng đường dẫn không tương thích
   New-Item -ItemType Directory -Path dist -Force | Out-Null
   Get-ChildItem ./skills -Directory | ForEach-Object {
       Compress-Archive -Path $_.FullName -DestinationPath "dist/$($_.Name).zip" -Force
   }
   ```

3. Vào **Customize > Skills**, chọn **+** → **Create skill** → **Upload a skill**, lần lượt tải lên năm tệp ZIP và bật tất cả.
4. Mô tả tác vụ trong cuộc hội thoại để skill được dùng tự động, hoặc gõ `/` trong ô nhập liệu để chọn skill.

**Giới hạn độ dài mô tả:** Claude Help Center nêu giới hạn 200 ký tự cho phần mô tả (tài liệu dành cho nhà phát triển trên claude.com và đặc tả Agent Skills cho phép 1.024 ký tự). Bundle này tuân theo giới hạn 200 ký tự chặt chẽ hơn; mỗi mô tả trong năm skill dài 161–177 ký tự.

**Phương án thay thế: tải cả năm skill lên cùng lúc dưới dạng plugin** (gói Pro trở lên). Plugin của Claude yêu cầu manifest `.claude-plugin/plugin.json`, repository này không kèm tệp đó; hãy tạo nó khi đóng gói:

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

Sau đó tải `dist/senior-network-engineer-bundle.zip` lên tại **Customize > Plugins**.

### ChatGPT

**ChatGPT desktop:** Dùng chung skill cục bộ với Codex; chỉ cần cài vào `~/.agents/skills` (xem phần tiếp theo). Gõ `@` trong ChatGPT để chọn skill.

**ChatGPT web:** Chỉ dành cho các gói Business, Enterprise, Healthcare và Edu, đồng thời phụ thuộc vào thiết lập của quản trị viên workspace.

1. Chọn **Plugins** ở thanh bên.
2. Trong **Plugin Directory**, mở tab **Skills**.
3. Chọn **Create** → **Upload from your computer** và lần lượt tải lên năm skill. ChatGPT sẽ quét từng tệp tải lên trước; kết quả có thể hiển thị "Needs Review" hoặc "Blocked".

Tài liệu chính thức của OpenAI không quy định định dạng tệp tải lên. Hãy thử các tệp ZIP cho từng skill ở phần trước; nếu không được chấp nhận, hãy điều chỉnh theo hướng dẫn trên màn hình tải lên.

### OpenAI Codex (CLI, IDE extension)

```bash
DEST=~/.agents/skills        # Với phạm vi dự án, dùng .agents/skills bên trong repository
```

- Sao chép hoặc tạo liên kết bằng các lệnh chung (tài liệu chính thức nêu rõ có hỗ trợ liên kết).
- Codex tự động phát hiện thay đổi của skill; hãy khởi động lại Codex nếu skill không xuất hiện.
- Gọi bằng `$senior-network-engineer`, hoặc chạy `/skills` để chọn.
- Đường dẫn cũ `$CODEX_HOME/skills` (`~/.codex/skills` khi chưa đặt `CODEX_HOME`) đã bị gỡ khỏi tài liệu chính thức, nhưng Codex vẫn tải nó như một đường dẫn deprecated. Nếu vẫn còn một bản của bundle này ở đó, các skill trùng tên sẽ xuất hiện hai lần; hãy gỡ bản cài đặt cũ.

### Google Antigravity (2.0, IDE, CLI)

```bash
DEST=~/.gemini/config/skills                # Antigravity 2.0 và IDE (global)
DEST=~/.gemini/antigravity-cli/skills       # Antigravity CLI (global)
DEST=<thư-mục-gốc-dự-án>/.agents/skills     # Phạm vi dự án dùng chung cho cả ba
```

- Ba giao diện dùng các đường dẫn global khác nhau. Nếu bạn dùng cả 2.0/IDE lẫn CLI, hãy cài vào cả hai đường dẫn global, hoặc dùng `.agents/skills` ở phạm vi dự án.
- IDE vẫn hỗ trợ đường dẫn cũ `~/.gemini/antigravity/skills`.
- Chuyển từ Gemini CLI: `~/.gemini/skills` tương ứng với `~/.gemini/antigravity-cli/skills`; thư mục `.gemini/skills` của dự án phải được đổi tên hoặc di chuyển thủ công sang `.agents/skills`.
- CLI cũng có thể cài qua plugin: tạo một thư mục chứa `plugin.json` và `skills/`, sau đó chạy `agy plugin install <thư-mục-plugin>`; gõ `/skills` trong TUI để xem các skill đã được tải.

### Gemini CLI

Gemini CLI đã ngừng phục vụ người dùng cá nhân từ ngày 2026-06-18 (được thay thế bằng Antigravity CLI). Chỉ giấy phép Gemini Code Assist Standard/Enterprise và Gemini API key trả phí mới có thể tiếp tục sử dụng.

```bash
DEST=~/.gemini/skills        # Hoặc ~/.agents/skills; với phạm vi dự án, dùng .gemini/skills hoặc .agents/skills
```

- Bạn cũng có thể tạo liên kết bằng lệnh chính thức: `gemini skills link ./skills`.
- Chạy `/skills reload` trong session để tải skill mới, và `/skills list` để xem chúng.
- Quyền truy cập tệp trong thư mục của skill chỉ được cấp khi skill được kích hoạt; bạn có thể thấy lời nhắc cấp quyền khi skill chính đọc một subskill.

### Cursor

```bash
DEST=~/.cursor/skills        # Hoặc ~/.agents/skills; với phạm vi dự án, dùng .cursor/skills hoặc .agents/skills
```

- Cursor tự động phát hiện skill khi khởi động; xem chúng tại **Customize → Skills**.
- Gọi bằng cách gõ `/` trong Agent chat rồi chọn skill.
- Chỉ `~/.cursor/skills` được đồng bộ lên Cloud Agents (bật **Sync Skills for Cloud Agents** trong **Settings → Agents**); `~/.agents/skills` không được đồng bộ lên Cloud Agents hay remote SSH.

### GitHub Copilot (VS Code agent mode, Copilot CLI)

```bash
DEST=~/.copilot/skills       # Hoặc ~/.agents/skills; với phạm vi dự án, dùng .github/skills hoặc .agents/skills
```

- Nếu giấy phép Copilot của bạn do tổ chức hoặc doanh nghiệp cấp, quản trị viên phải cho phép các tính năng liên quan trong policy.
- VS Code: gõ `/skills` trong Chat để mở phần thiết lập skill. Copilot CLI: `/skills list`, `/skills reload`.
- Copilot cloud agent và code review chạy trên GitHub và chỉ đọc skill nằm trong repository (phạm vi dự án).

### Hermes Agent

```bash
DEST=~/.hermes/skills/network   # Đặt cả năm skill trong cùng một thư mục category
```

- Skill mới có hiệu lực trong session mới (hoặc chạy `/reset`).
- `.hermes/skills` và `.agents/skills` của dự án chỉ được tải sau khi bạn chạy `hermes skills trust` trong repository đó.
- Nếu các skill đã được cài trong `~/.agents/skills`, hãy thêm đường dẫn đó vào `skills.external_dirs` trong `~/.hermes/config.yaml` để dùng chung.
- Không khuyến nghị cài từng skill từ GitHub bằng `hermes skills install`: lệnh này chỉ sao chép các tệp được `SKILL.md` tham chiếu trực tiếp, nên các tham chiếu `../` giữa các skill sẽ không được tải về.

## Cách sử dụng

Hãy mô tả tác vụ của bạn, công cụ sẽ tự động chọn skill dựa trên phần mô tả của chúng. Để chỉ định rõ một skill, hãy gọi nó theo cách nền tảng của bạn hỗ trợ (xem bảng tra cứu nhanh). Ví dụ, trong Codex:

```text
$senior-network-engineer Hãy phân tích sự cố mạng đa hãng này. Trước tiên liệt kê bằng chứng và các giả thuyết, sau đó đưa ra MOP kèm kế hoạch rollback. Vui lòng trả lời bằng tiếng Việt.
```

Với câu hỏi chỉ liên quan đến một hãng, bạn có thể gọi trực tiếp subskill, chẳng hạn `palo-alto-architect`, `fortinet-security-fabric-architect`, `cisco-network-dc-architect` hoặc `hpe-aruba-network-architect`.

## Cập nhật

Trên máy tính nơi bạn đã thực hiện thay đổi:

```bash
git status --short
git add -- <các-tệp-thực-sự-đã-thay-đổi>
git commit -m "<mô tả cho một mục đích duy nhất>"
git push
```

Trên các máy tính khác:

```bash
git pull --ff-only
```

- Công cụ cài bằng liên kết: thay đổi có hiệu lực ngay sau khi pull.
- Công cụ cài bằng cách sao chép: chạy lại lệnh sao chép sau khi pull.
- Nền tảng dạng tải lên (Claude, ChatGPT web): đóng gói lại và tải lên lại các skill đã thay đổi.

## Thông tin có tính thời điểm

- Phiên bản, EoL/EoS, CVE, Recommended Releases, khả năng hỗ trợ PQC và khả năng của công cụ AI đều dựa trên tài liệu của hãng hoặc tài liệu chính thức, với ngày xác minh được ghi trong nội dung.
- Đường dẫn skill và quy trình tải lên của các công cụ AI thay đổi thường xuyên. Tài liệu này phản ánh tài liệu chính thức tính đến ngày 2026-09-27; nếu skill không được tải sau khi cài đặt, hãy kiểm tra tài liệu mới nhất của công cụ trước.
- Tại thời điểm xác minh, các mục sau chỉ tìm thấy ở nguồn bên thứ ba hoặc cộng đồng vì trang chính thức yêu cầu đăng nhập cổng hỗ trợ của hãng. Nội dung skill đánh dấu chúng là "cần xác minh lại trước khi trích dẫn":
  - Ngày EoS của FortiNAC 9.4 và ngày End of Order của FortiGate CNF (Fortinet Product Life Cycle, yêu cầu tài khoản FortiCare)
  - EoS phần mềm AirWave và tình trạng ngừng bán của 2930F/2930M/5400R (HPE Networking Support Portal)
- Khi cập nhật nội dung có tính thời điểm, hãy đồng thời cập nhật ngày xác minh trong phần liên quan và `version` trong `bundle-manifest.json`.

## Quy tắc bảo trì

- Chỉ chỉnh sửa bản chuẩn của skill bên trong `skills/`; không chỉnh sửa các bản sao tại vị trí cài đặt.
- Giữ năm skill ở cùng một cấp; giữ `SKILL.md` ngắn gọn và dưới 500 dòng, phần chi tiết đặt trong `references/` sâu một cấp.
- `name` trong frontmatter phải khớp với tên thư mục; `description` tối đa 200 ký tự (để phù hợp giới hạn tải lên của Claude Help Center) và phải nêu rõ cả chức năng của skill lẫn thời điểm kích hoạt nó.
- Không khẳng định CVE, fixed release, EoL, PQC, CLI, cấp phép hay tính năng nền tảng AI dựa trên trí nhớ; hãy dựa vào tài liệu của hãng hoặc tài liệu chính thức và ghi lại ngày xác minh.
- Không commit cấu hình của khách hàng, PCAP, tài khoản, mật khẩu, PSK, private key, API token, license hay tệp đính kèm của ticket.
- Các khuyến nghị có rủi ro cao phải kèm bằng chứng, blast radius, điều kiện dừng, rollback và kiểm chứng.
- `README.md` (tiếng Trung phồn thể) là README bản chuẩn. Khi thay đổi tệp này, hãy cập nhật mọi bản dịch `README/README.<lang>.md` trong cùng một commit.
