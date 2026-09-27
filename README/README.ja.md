# Senior Network Engineer Skill Bundle

[繁體中文](../README.md) | [English](README.en.md) | [简体中文](README.zh-CN.md) | [粵語](README.yue.md) | **日本語** | [한국어](README.ko.md) | [Español](README.es.md) | [Português (Brasil)](README.pt-BR.md) | [Français](README.fr.md) | [Deutsch](README.de.md) | [Русский](README.ru.md) | [Tiếng Việt](README.vi.md) | [Bahasa Indonesia](README.id.md) | [ไทย](README.th.md) | [Türkçe](README.tr.md) | [العربية](README.ar.md)

個人利用向けのシニアネットワークエンジニア Skill バンドルです。マルチベンダー対応のメイン Skill 1 つと、ベンダー別の subskill 4 つを 1 つの Git リポジトリにまとめ、複数のコンピューターや AI ツールで同じ正本を共有できるようにしています。

Skill は [Agent Skills オープンフォーマット](https://agentskills.io/specification)（フォルダーに `SKILL.md` と任意の `references/` を含む）に準拠しており、Claude、ChatGPT/Codex、Google Antigravity、Gemini CLI、Cursor、GitHub Copilot など、このフォーマットに対応したツールにインストールできます。

時効性のある内容（バージョン、EoL、CVE、PQC、AI ツールの機能とインストールパス）の確認基準日は **2026-09-27** です。

> **言語について：** Skill 本文は繁体字中国語で書かれており、AI には既定で繁体字中国語と台湾の企業 IT 用語で回答するよう指示しています。他の言語で回答が必要な場合は、リクエスト内で明示してください。

## 目次

- [収録 Skill](#収録-skill)
- [ディレクトリ構成](#ディレクトリ構成)
- [インストール前の注意](#インストール前の注意)
- [共通インストールコマンド](#共通インストールコマンド)
- [プラットフォーム別インストール](#プラットフォーム別インストール)
- [使い方](#使い方)
- [更新](#更新)
- [時効性のある情報](#時効性のある情報)
- [メンテナンスルール](#メンテナンスルール)

## 収録 Skill

| Skill | 対象範囲 |
|---|---|
| `senior-network-engineer` | メイン Skill。マルチベンダーのアーキテクチャとトラブルシューティング、パケット/session 分析、HA/DR、CVE とバージョン管理、PQC、CEH/CISSP セキュリティ基礎、AI Agent/MCP ガバナンス、顧客およびベンダーとのコミュニケーション、HLD/LLD/MOP/RCA と教育研修。質問内容に応じて以下の subskill にルーティング |
| `palo-alto-architect` | PAN-OS NGFW、Panorama、Strata Cloud Manager、Prisma SASE、Cortex（XDR/XSIAM/XSOAR/AgentiX/Cortex Cloud）、CVE と PQC |
| `fortinet-security-fabric-architect` | FortiGate/FortiOS、FortiManager、FortiAnalyzer、SD-WAN、ZTNA、SSL VPN から IPsec への移行、PSIRT と PQC/QKD |
| `cisco-network-dc-architect` | Catalyst、Nexus/Nexus Dashboard、ACI、VXLAN EVPN、Catalyst SD-WAN、9800/CW9800 WLC、ISE、Secure Firewall、PSIRT と PQC/MACsec |
| `hpe-aruba-network-architect` | AOS-8/AOS-10、Instant AOS-8、HPE Aruba Networking Central、ClearPass、AOS-CX/AOS-Switch、HPE Security Bulletin と PPK/PQC |

## ディレクトリ構成

```text
.
├── README.md                             # 繁体字中国語（正本）
├── README/                               # 翻訳版（15 言語）
│   └── README.<lang>.md
├── bundle-manifest.json                  # バンドル名、バージョン、Skill 一覧
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

## インストール前の注意

1. **5 つの Skill は同じフォルダーにまとめてインストールしてください。** メイン Skill は相対パス `../<subskill>/SKILL.md` で subskill を読み込むため、5 つのフォルダーが並んでいないと見つかりません。
2. **フォルダー名を変更しないでください。** 多くのツールはフォルダー名と `SKILL.md` の `name` の一致を要求し、一致しない場合は読み込まずにスキップすることがあります。
3. **アップロード方式のプラットフォーム（Claude Web 版/デスクトップ版、ChatGPT Web 版）では 5 つすべてをアップロードして有効化してください。** これらのプラットフォームでは各 Skill が独立しています。Anthropic ヘルプセンターによると Skill は他の Skill を明示的に参照できませんが、Claude は複数の Skill を自動的に組み合わせて使用します。
4. **一度のインストールで複数ツールから共有できます。** `~/.agents/skills` はツール横断の共有場所で、Codex/ChatGPT デスクトップ版、Cursor、GitHub Copilot、Gemini CLI が読み込みます。Claude Code と Antigravity はそれぞれ専用のディレクトリへのインストールが必要です。

## 共通インストールコマンド

まず本リポジトリを clone し、リポジトリのルートで実行してください。`$dest`／`DEST` は次節のプラットフォーム別対照表にあるパスに置き換えます。

**Windows（PowerShell）**

```powershell
git clone https://github.com/Scorpio-meow/senior-network-engineer-skill-bundle.git
Set-Location senior-network-engineer-skill-bundle

$dest = Join-Path $HOME '.agents/skills'      # プラットフォームに応じて置き換え
New-Item -ItemType Directory -Path $dest -Force | Out-Null

# 方法 1：コピー（互換性が最も高い。更新後は再コピーが必要）
Copy-Item ./skills/* $dest -Recurse -Force

# 方法 2：Junction を作成（リポジトリの変更が即時反映。リンク対応が公式に明記されたツールのみ）
Get-ChildItem ./skills -Directory | ForEach-Object {
    New-Item -ItemType Junction -Path (Join-Path $dest $_.Name) -Target $_.FullName
}
```

**macOS / Linux**

```bash
git clone https://github.com/Scorpio-meow/senior-network-engineer-skill-bundle.git
cd senior-network-engineer-skill-bundle

DEST=~/.agents/skills        # プラットフォームに応じて置き換え
mkdir -p "$DEST"

# 方法 1：コピー
cp -R skills/* "$DEST/"

# 方法 2：シンボリックリンク（リンク対応が公式に明記されたツールのみ）
for d in "$PWD"/skills/*/; do ln -s "${d%/}" "$DEST/"; done
```

インストール先に同名のフォルダーが既にある場合、リンクの作成は失敗します。先に旧バージョンをご自身でバックアップまたは削除してください。

## プラットフォーム別インストール

### クイックリファレンス

| プラットフォーム | 個人（グローバル）パス | プロジェクトパス | リンク対応 | 手動呼び出し |
|---|---|---|---|---|
| Claude Code | `~/.claude/skills` | `.claude/skills` | あり | `/senior-network-engineer` |
| Claude Web 版/デスクトップ版 | ZIP をアップロード（下記参照） | — | — | `/` を入力して選択 |
| ChatGPT デスクトップ版、Codex CLI/IDE | `~/.agents/skills` | `.agents/skills` | あり | ChatGPT：`@`、Codex：`$senior-network-engineer` または `/skills` |
| ChatGPT Web 版 | アップロード（下記参照） | — | — | 自動または `@` |
| Antigravity 2.0 / IDE | `~/.gemini/config/skills` | `.agents/skills` | 記載なし | `/senior-network-engineer` |
| Antigravity CLI | `~/.gemini/antigravity-cli/skills` | `.agents/skills` | 記載なし | `/senior-network-engineer` |
| Gemini CLI | `~/.gemini/skills` または `~/.agents/skills` | `.gemini/skills` または `.agents/skills` | あり | 自動（`/skills list` で確認） |
| Cursor | `~/.cursor/skills` または `~/.agents/skills` | `.cursor/skills` または `.agents/skills` | 記載なし | Agent chat で `/` を入力 |
| GitHub Copilot（VS Code、CLI） | `~/.copilot/skills` または `~/.agents/skills` | `.github/skills` または `.agents/skills` | 記載なし | `/senior-network-engineer` |
| Hermes Agent | `~/.hermes/skills/<カテゴリー>` | `.hermes/skills` または `.agents/skills` | 記載なし | `/senior-network-engineer` |

どのツールも description がタスクに合致すれば Skill を自動的に読み込みます。「記載なし」のツールは公式ドキュメントにリンク対応の有無が書かれていないため、コピーでのインストールを推奨します。

### Claude Code

```bash
DEST=~/.claude/skills        # プロジェクト範囲では .claude/skills を使用
```

- 共通コマンドでコピーまたはリンクを作成します（公式ドキュメントでリンク対応が明記されています）。
- 変更は現在の session で自動的に反映されます。起動時に `~/.claude/skills` が存在しなかった場合は `/reload-skills` を実行してください。
- `/skills` と入力すると読み込み済みの Skill を確認できます。
- `~/.claude/skills` はローカルの Claude Code にのみ適用され、Cowork やクラウド session には含まれません。

### Claude（claude.ai Web 版、デスクトップ版）

有料プラン（Pro、Max、Team、Enterprise）で利用できます。

1. コード実行を有効にします：**Settings > Capabilities > Code execution and file creation**。Team/Enterprise では Owner が **Organization settings > Plugins & skills** で Skills とコード実行を有効にする必要があります。
2. 5 つの Skill をそれぞれ個別の ZIP にパッケージします。ZIP 内の最上位は Skill フォルダーそのもの（例：`palo-alto-architect/SKILL.md`）である必要があり、`SKILL.md` を ZIP のルートに直接置いてはいけません。

   ```bash
   mkdir -p dist && cd skills
   for s in */; do zip -r "../dist/${s%/}.zip" "${s%/}"; done
   cd .. && unzip -l dist/senior-network-engineer.zip   # すべての行が senior-network-engineer/ で始まること
   ```

   ```powershell
   # Windows では PowerShell 7（pwsh）で実行してください。Windows PowerShell 5.1 の Compress-Archive が生成するパス形式は互換性がない場合があります
   New-Item -ItemType Directory -Path dist -Force | Out-Null
   Get-ChildItem ./skills -Directory | ForEach-Object {
       Compress-Archive -Path $_.FullName -DestinationPath "dist/$($_.Name).zip" -Force
   }
   ```

3. **Customize > Skills** を開き、**+** → **Create skill** → **Upload a skill** を選択して 5 つの ZIP を順にアップロードし、すべて有効にします。
4. 会話でタスクを説明すると自動的に使用されます。入力欄で `/` を入力して Skill を選ぶこともできます。

**description の文字数制限**：Claude ヘルプセンターでは description の上限を 200 文字としています（claude.com の開発者ドキュメントと Agent Skills 仕様では 1,024 文字）。本バンドルはより厳しい 200 文字に合わせて記述しており、5 つの description はいずれも 161–177 文字です。

**代替方法：plugin として 5 つの Skill を一括アップロード**（Pro 以上のプラン）。Claude の plugin には `.claude-plugin/plugin.json` マニフェストが必要ですが、本リポジトリには含まれていないため、パッケージ時に生成します：

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

その後 **Customize > Plugins** で `dist/senior-network-engineer-bundle.zip` をアップロードします。

### ChatGPT

**ChatGPT デスクトップ版**：Codex とローカルの Skill を共有するため、`~/.agents/skills` にインストールするだけで使えます（次節参照）。ChatGPT で `@` を入力して Skill を選択します。

**ChatGPT Web 版**：Business、Enterprise、Healthcare、Edu プラン限定で、ワークスペースの管理設定に従います。

1. サイドバーで **Plugins** を選択します。
2. **Plugin Directory** で **Skills** タブを開きます。
3. **Create** → **Upload from your computer** を選び、5 つの Skill を 1 つずつアップロードします。ChatGPT は最初にスキャンを行い、結果が「Needs Review」または「Blocked」と表示されることがあります。

OpenAI の公式ドキュメントにはアップロードするファイル形式の説明がありません。まず前節の Skill 単位の ZIP を試し、受け付けられない場合はアップロード画面の説明に従って調整してください。

### OpenAI Codex（CLI、IDE extension）

```bash
DEST=~/.agents/skills        # プロジェクト範囲ではリポジトリ内の .agents/skills を使用
```

- 共通コマンドでコピーまたはリンクを作成します（公式ドキュメントでリンク対応が明記されています）。
- Codex は Skill の変更を自動検出します。表示されない場合は Codex を再起動してください。
- 呼び出し：`$senior-network-engineer`、または `/skills` を実行して選択します。
- 旧パス `$CODEX_HOME/skills`（`CODEX_HOME` 未設定時は `~/.codex/skills`）は公式ドキュメントから削除されましたが、Codex は deprecated パスとして引き続き読み込みます。旧パスに本バンドルの別コピーが残っていると同名の Skill が 2 回表示されるため、旧インストールを削除してください。

### Google Antigravity（2.0、IDE、CLI）

```bash
DEST=~/.gemini/config/skills                # Antigravity 2.0 と IDE（グローバル）
DEST=~/.gemini/antigravity-cli/skills       # Antigravity CLI（グローバル）
DEST=<プロジェクトルート>/.agents/skills    # 3 つで共通のプロジェクト範囲
```

- 3 つのインターフェースはグローバルパスが異なります。2.0/IDE と CLI を併用する場合は両方のグローバルパスにインストールするか、プロジェクト範囲の `.agents/skills` を使用してください。
- IDE は旧パス `~/.gemini/antigravity/skills` も引き続きサポートしています。
- Gemini CLI からの移行：`~/.gemini/skills` は `~/.gemini/antigravity-cli/skills` に対応します。プロジェクト内の `.gemini/skills` は手動で名前を変更するか `.agents/skills` に移動してください。
- CLI は plugin でもインストールできます：`plugin.json` と `skills/` を含むフォルダーを作成してから `agy plugin install <plugin フォルダー>` を実行します。TUI で `/skills` と入力すると読み込み済みの Skill を確認できます。

### Gemini CLI

Gemini CLI は 2026-06-18 をもって個人ユーザー向けの提供を終了しました（Antigravity CLI に移行）。現在は Gemini Code Assist Standard/Enterprise ライセンスと有料の Gemini API key でのみ引き続き利用できます。

```bash
DEST=~/.gemini/skills        # または ~/.agents/skills。プロジェクト範囲では .gemini/skills または .agents/skills
```

- 公式コマンドでリンクを作成することもできます：`gemini skills link ./skills`。
- session 内で `/skills reload` を実行すると新しい Skill を読み込み、`/skills list` で一覧を確認できます。
- Skill のフォルダーへのファイルアクセスは、その Skill が有効化されたときにのみ許可されます。メイン Skill が subskill を読み込む際に許可プロンプトが表示されることがあります。

### Cursor

```bash
DEST=~/.cursor/skills        # または ~/.agents/skills。プロジェクト範囲では .cursor/skills または .agents/skills
```

- Cursor は起動時に Skill を自動検出します。**Customize → Skills** で確認できます。
- 呼び出し：Agent chat で `/` を入力して Skill を選択します。
- Cloud Agents に同期されるのは `~/.cursor/skills` のみです（**Settings → Agents** で **Sync Skills for Cloud Agents** を有効にする必要があります）。`~/.agents/skills` は Cloud Agents やリモート SSH には同期されません。

### GitHub Copilot（VS Code agent mode、Copilot CLI）

```bash
DEST=~/.copilot/skills       # または ~/.agents/skills。プロジェクト範囲では .github/skills または .agents/skills
```

- 組織または企業経由で Copilot ライセンスを取得している場合、管理者がポリシーで関連機能を許可する必要があります。
- VS Code：Chat で `/skills` と入力すると Skill の設定が開きます。Copilot CLI：`/skills list`、`/skills reload`。
- Copilot cloud agent と code review は GitHub 上で実行され、リポジトリ内（プロジェクト範囲）の Skill のみを読み込みます。

### Hermes Agent

```bash
DEST=~/.hermes/skills/network   # 5 つの Skill を同じカテゴリーフォルダーに配置
```

- 新しい Skill は新しい session で有効になります（または `/reset` を実行）。
- プロジェクト内の `.hermes/skills`、`.agents/skills` は、そのリポジトリで `hermes skills trust` を実行するまで読み込まれません。
- すでに `~/.agents/skills` にインストール済みの場合は、`~/.hermes/config.yaml` の `skills.external_dirs` にそのパスを追加すると共有できます。
- `hermes skills install` で GitHub から 1 つずつインストールする方法は推奨しません：`SKILL.md` が直接参照するファイルしかコピーされず、Skill 間の `../` 参照はダウンロードされないためです。

## 使い方

タスクを説明するだけで、ツールが description に基づいて Skill を自動選択します。明示的に指定したい場合は、各プラットフォームの方法で手動呼び出しします（クイックリファレンス参照）。例えば Codex では：

```text
$senior-network-engineer このマルチベンダー環境のネットワーク障害を分析してください。まず証拠と仮説を挙げ、その後ロールバック可能な MOP を提示してください。日本語で回答してください。
```

単一ベンダーの問題は subskill を直接呼び出すこともできます。例：`palo-alto-architect`、`fortinet-security-fabric-architect`、`cisco-network-dc-architect`、`hpe-aruba-network-architect`。

## 更新

内容を変更したコンピューターで：

```bash
git status --short
git add -- <実際に変更したファイル>
git commit -m "<単一目的の説明>"
git push
```

他のコンピューターで：

```bash
git pull --ff-only
```

- リンクでインストールしたツール：pull 後すぐに反映されます。
- コピーでインストールしたツール：pull 後にコピーコマンドを再実行します。
- アップロード方式のプラットフォーム（Claude、ChatGPT Web 版）：変更のあった Skill を再パッケージしてアップロードします。

## 時効性のある情報

- バージョン、EoL/EoS、CVE、Recommended Release、PQC 対応、AI ツールの機能は、ベンダーまたは公式ドキュメントを基準とし、本文に確認日を記載しています。
- 各 AI ツールの Skill パスとアップロード手順は頻繁に変わります。本ドキュメントは 2026-09-27 時点の公式ドキュメントに基づいています。インストール後に読み込まれない場合は、まずそのツールの最新ドキュメントを確認してください。
- 以下の情報は、公式ページの閲覧にベンダーのサポートポータルへのログインが必要なため、確認時点では第三者またはコミュニティの情報源しか見つかりませんでした。Skill 本文では「引用前に再確認」と注記しています：
  - FortiNAC 9.4 の EoS と FortiGate CNF の End of Order 日付（Fortinet Product Life Cycle、FortiCare アカウントが必要）
  - AirWave ソフトウェアの EoS と 2930F/2930M/5400R の販売終了状況（HPE Networking Support Portal）
- 時効性のある内容を更新するときは、該当箇所の確認日と `bundle-manifest.json` の `version` も併せて更新してください。

## メンテナンスルール

- Skill の正本は `skills/` 内でのみ編集し、インストール先のコピーは直接編集しないでください。
- 5 つの Skill は同じ階層に保ち、`SKILL.md` は簡潔に 500 行未満とし、詳細は 1 階層の `references/` に置いてください。
- Frontmatter の `name` はフォルダー名と一致させ、`description` は 200 文字以内（Claude ヘルプセンターのアップロード制限に合わせる）で、機能と発動タイミングの両方を記述してください。
- CVE、fixed release、EoL、PQC、CLI、ライセンス、AI プラットフォームの機能を記憶に頼って記述せず、ベンダーまたは公式ドキュメントに基づき確認日を明記してください。
- 顧客の設定、PCAP、アカウント、パスワード、PSK、秘密鍵、API token、ライセンス、チケット添付ファイルをコミットしないでください。
- 高リスクな提案には、証拠、blast radius、中止条件、ロールバック、検証を必ず含めてください。
- `README.md`（繁体字中国語）が README の正本です。変更する際は同じ commit ですべての `README/README.<lang>.md` 翻訳版も更新してください。
