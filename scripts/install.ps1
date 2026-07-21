[CmdletBinding(SupportsShouldProcess = $true)]
param(
    [ValidateSet('Link', 'Copy')]
    [string]$Mode = 'Link',
    [string]$SkillRoot,
    [switch]$Force
)

$ErrorActionPreference = 'Stop'
$bundleRoot = [System.IO.Path]::GetFullPath((Split-Path -Parent $PSScriptRoot))
$sourceRoot = Join-Path $bundleRoot 'skills'
$skillNames = @(
    'senior-network-engineer',
    'palo-alto-architect',
    'fortinet-security-fabric-architect',
    'cisco-network-dc-architect',
    'hpe-aruba-network-architect'
)

& (Join-Path $PSScriptRoot 'validate.ps1') -BundleRoot $bundleRoot
$validationSucceeded = $?
if (-not $validationSucceeded) {
    throw 'Bundle 驗證失敗，停止安裝。'
}

if ([string]::IsNullOrWhiteSpace($SkillRoot)) {
    if (-not [string]::IsNullOrWhiteSpace($env:CODEX_HOME)) {
        $SkillRoot = Join-Path $env:CODEX_HOME 'skills'
    } else {
        $legacyRoot = Join-Path $HOME '.codex/skills'
        if (Test-Path -LiteralPath $legacyRoot -PathType Container) {
            $SkillRoot = $legacyRoot
        } else {
            $SkillRoot = Join-Path $HOME '.agents/skills'
        }
    }
}

$SkillRoot = [System.IO.Path]::GetFullPath($SkillRoot)
$skillRootPrefix = $SkillRoot.TrimEnd('\', '/') + [System.IO.Path]::DirectorySeparatorChar
$backupBase = Join-Path (Split-Path -Parent $SkillRoot) 'skill-backups/senior-network-engineer-skill-bundle'
$timestamp = Get-Date -Format 'yyyyMMdd-HHmmss'
$backupRoot = Join-Path $backupBase $timestamp

$operations = foreach ($skill in $skillNames) {
    $source = [System.IO.Path]::GetFullPath((Join-Path $sourceRoot $skill))
    $target = [System.IO.Path]::GetFullPath((Join-Path $SkillRoot $skill))
    if (-not $target.StartsWith($skillRootPrefix, [System.StringComparison]::OrdinalIgnoreCase)) {
        throw "安裝目標超出 Skill root：$target"
    }
    if (-not (Test-Path -LiteralPath (Join-Path $source 'SKILL.md') -PathType Leaf)) {
        throw "來源 Skill 不完整：$source"
    }

    $sameLink = $false
    if (Test-Path -LiteralPath $target) {
        $existing = Get-Item -LiteralPath $target -Force
        if (($existing.Attributes -band [System.IO.FileAttributes]::ReparsePoint) -ne 0 -and $existing.Target) {
            $linkTarget = [System.IO.Path]::GetFullPath([string]$existing.Target)
            $sameLink = $linkTarget -eq $source
        }
    }

    [pscustomobject]@{
        Skill = $skill
        Source = $source
        Target = $target
        Exists = (Test-Path -LiteralPath $target)
        SameLink = $sameLink
    }
}

$conflicts = @($operations | Where-Object { $_.Exists -and -not $_.SameLink })
if ($conflicts.Count -gt 0 -and -not $Force) {
    $paths = ($conflicts.Target -join "`n- ")
    throw "下列目標已存在。先用 -WhatIf 檢查，再以 -Force 備份並接管：`n- $paths"
}

if (-not (Test-Path -LiteralPath $SkillRoot -PathType Container)) {
    if ($PSCmdlet.ShouldProcess($SkillRoot, '建立 Skill root')) {
        New-Item -ItemType Directory -Path $SkillRoot -Force | Out-Null
    }
}

foreach ($op in $operations) {
    if ($op.SameLink -and $Mode -eq 'Link') {
        Write-Host "[SKIP] $($op.Skill) 已連結至正確來源"
        continue
    }

    if ($op.Exists) {
        $backupTarget = Join-Path $backupRoot $op.Skill
        if ($PSCmdlet.ShouldProcess($op.Target, "備份至 $backupTarget")) {
            New-Item -ItemType Directory -Path $backupRoot -Force | Out-Null
            Move-Item -LiteralPath $op.Target -Destination $backupTarget
        }
    }

    if ($Mode -eq 'Link') {
        if ($PSCmdlet.ShouldProcess($op.Target, "建立指向 $($op.Source) 的連結")) {
            if ($env:OS -eq 'Windows_NT') {
                New-Item -ItemType Junction -Path $op.Target -Target $op.Source | Out-Null
            } else {
                New-Item -ItemType SymbolicLink -Path $op.Target -Target $op.Source | Out-Null
            }
        }
    } else {
        if ($PSCmdlet.ShouldProcess($op.Target, "複製 $($op.Source)")) {
            Copy-Item -LiteralPath $op.Source -Destination $op.Target -Recurse
        }
    }

    Write-Host "[OK] $($op.Skill) -> $($op.Target)"
}

Write-Host "`n安裝模式：$Mode"
Write-Host "Skill root：$SkillRoot"
if ($conflicts.Count -gt 0 -and $Force) {
    Write-Host "既有內容備份：$backupRoot"
}
Write-Host '若 Codex 未立即顯示更新，請重新啟動 Codex。'
