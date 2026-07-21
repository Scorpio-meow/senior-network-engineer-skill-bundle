[CmdletBinding()]
param()

$ErrorActionPreference = 'Stop'
$bundleRoot = [System.IO.Path]::GetFullPath((Split-Path -Parent $PSScriptRoot))

$dirty = git -C $bundleRoot status --porcelain
if ($LASTEXITCODE -ne 0) {
    throw "不是有效的 Git repository：$bundleRoot"
}
if ($dirty) {
    throw '本機有未提交修改，停止 pull。請先 commit、stash 或人工處理差異。'
}

git -C $bundleRoot pull --ff-only
if ($LASTEXITCODE -ne 0) {
    throw 'git pull --ff-only 失敗，請人工處理 branch 或網路問題。'
}

& (Join-Path $PSScriptRoot 'validate.ps1') -BundleRoot $bundleRoot
$validationSucceeded = $?
if (-not $validationSucceeded) {
    throw '更新後驗證失敗，請檢查最新 commit。'
}

Write-Host '更新完成。Link 模式已立即生效；Copy 模式請重新執行 install.ps1 -Mode Copy -Force。'
