[CmdletBinding()]
param(
    [string]$BundleRoot
)

$ErrorActionPreference = 'Stop'
$errors = [System.Collections.Generic.List[string]]::new()
$utf8Strict = [System.Text.UTF8Encoding]::new($false, $true)
$expectedSkills = @(
    'senior-network-engineer',
    'palo-alto-architect',
    'fortinet-security-fabric-architect',
    'cisco-network-dc-architect',
    'hpe-aruba-network-architect'
)

function Add-ValidationError {
    param([string]$Message)
    $script:errors.Add($Message)
}

if ([string]::IsNullOrWhiteSpace($BundleRoot)) {
    $BundleRoot = Split-Path -Parent $PSScriptRoot
}
$BundleRoot = [System.IO.Path]::GetFullPath($BundleRoot)
$skillsRoot = Join-Path $BundleRoot 'skills'
$manifestPath = Join-Path $BundleRoot 'bundle-manifest.json'

if (-not (Test-Path -LiteralPath $manifestPath -PathType Leaf)) {
    Add-ValidationError "缺少 bundle-manifest.json：$manifestPath"
} else {
    try {
        $manifest = [System.IO.File]::ReadAllText($manifestPath, $utf8Strict) | ConvertFrom-Json
        $manifestSkills = @($manifest.skills)
        foreach ($skill in $expectedSkills) {
            if ($skill -notin $manifestSkills) {
                Add-ValidationError "manifest 缺少 Skill：$skill"
            }
        }
    } catch {
        Add-ValidationError "manifest 不是有效 UTF-8 JSON：$($_.Exception.Message)"
    }
}

foreach ($skill in $expectedSkills) {
    $skillRoot = Join-Path $skillsRoot $skill
    $skillFile = Join-Path $skillRoot 'SKILL.md'
    $agentFile = Join-Path $skillRoot 'agents/openai.yaml'

    if (-not (Test-Path -LiteralPath $skillFile -PathType Leaf)) {
        Add-ValidationError "缺少 $skill/SKILL.md"
        continue
    }
    if (-not (Test-Path -LiteralPath $agentFile -PathType Leaf)) {
        Add-ValidationError "缺少 $skill/agents/openai.yaml"
        continue
    }

    try {
        $skillText = [System.IO.File]::ReadAllText($skillFile, $utf8Strict)
        $agentText = [System.IO.File]::ReadAllText($agentFile, $utf8Strict)
    } catch {
        Add-ValidationError "$skill 含無效 UTF-8：$($_.Exception.Message)"
        continue
    }

    if ($skillText.Contains([char]0xFFFD) -or $agentText.Contains([char]0xFFFD)) {
        Add-ValidationError "$skill 含 Unicode replacement character"
    }

    $frontmatter = [regex]::Match($skillText, '\A---\r?\n(?<yaml>[\s\S]*?)\r?\n---(?:\r?\n|$)')
    if (-not $frontmatter.Success) {
        Add-ValidationError "$skill 的 YAML frontmatter 格式錯誤"
        continue
    }

    $yaml = $frontmatter.Groups['yaml'].Value
    $nameMatch = [regex]::Match($yaml, '(?m)^name:\s*([a-z0-9-]+)\s*$')
    $descriptionMatch = [regex]::Match($yaml, '(?m)^description:\s*(.+?)\s*$')
    if (-not $nameMatch.Success -or $nameMatch.Groups[1].Value -ne $skill) {
        Add-ValidationError "$skill 的 frontmatter name 與目錄不一致"
    }
    if (-not $descriptionMatch.Success -or $descriptionMatch.Groups[1].Value.Length -gt 1024) {
        Add-ValidationError "$skill 的 description 缺漏或超過 1024 字元"
    }

    $lineCount = ($skillText -split '\r?\n').Count
    if ($lineCount -gt 500) {
        Add-ValidationError "$skill/SKILL.md 為 $lineCount 行，超過 500 行"
    }

    $promptToken = '$' + $skill
    if (-not $agentText.Contains($promptToken)) {
        Add-ValidationError "$skill/agents/openai.yaml 的 default_prompt 未包含 $promptToken"
    }

    Write-Host "[OK] $skill ($lineCount lines)"
}

$mainSkill = Join-Path $skillsRoot 'senior-network-engineer/SKILL.md'
if (Test-Path -LiteralPath $mainSkill -PathType Leaf) {
    $mainRoot = Split-Path -Parent $mainSkill
    $mainText = [System.IO.File]::ReadAllText($mainSkill, $utf8Strict)
    $tick = [char]96
    $linkPattern = [regex]::Escape([string]$tick) + '(?<path>(?:references/|\.\./)[^' + [regex]::Escape([string]$tick) + ']+)' + [regex]::Escape([string]$tick)
    $linkedPaths = [regex]::Matches($mainText, $linkPattern) |
        ForEach-Object { $_.Groups['path'].Value } |
        Sort-Object -Unique
    foreach ($linkedPath in $linkedPaths) {
        $nativePath = $linkedPath.Replace('/', [System.IO.Path]::DirectorySeparatorChar)
        $resolved = [System.IO.Path]::GetFullPath((Join-Path $mainRoot $nativePath))
        if (-not (Test-Path -LiteralPath $resolved)) {
            Add-ValidationError "主 Skill 引用不存在：$linkedPath"
        }
    }
}

$allFiles = Get-ChildItem -LiteralPath $skillsRoot -Recurse -File
foreach ($file in $allFiles) {
    try {
        $text = [System.IO.File]::ReadAllText($file.FullName, $utf8Strict)
        if ($text.Contains([char]0xFFFD)) {
            Add-ValidationError "含 Unicode replacement character：$($file.FullName)"
        }
        if ($text -match '(?im)\b(TODO|FIXME|PLACEHOLDER)\b') {
            Add-ValidationError "含未完成標記：$($file.FullName)"
        }
        if ($text -match '-----BEGIN (?:RSA |EC |OPENSSH )?PRIVATE KEY-----') {
            Add-ValidationError "疑似包含私鑰：$($file.FullName)"
        }
        if ($text -match '(?i)\bgh[opusr]_[A-Za-z0-9_]{20,}\b|\bsk-[A-Za-z0-9_-]{20,}\b') {
            Add-ValidationError "疑似包含 API token：$($file.FullName)"
        }
    } catch {
        Add-ValidationError "無法以嚴格 UTF-8 讀取：$($file.FullName)"
    }
}

if ($errors.Count -gt 0) {
    Write-Host "`n驗證失敗：" -ForegroundColor Red
    $errors | ForEach-Object { Write-Host "- $_" -ForegroundColor Red }
    exit 1
}

Write-Host "`n全部驗證通過：$($expectedSkills.Count) 個 Skill。" -ForegroundColor Green
