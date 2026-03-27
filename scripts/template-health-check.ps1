param(
    [string]$RepoRoot = (Get-Location).Path,
    [string]$ReportPath = "scripts/reports/template-health-report.json"
)

Set-StrictMode -Version Latest
$ErrorActionPreference = "Stop"

$results = New-Object System.Collections.Generic.List[object]

function Add-CheckResult {
    param(
        [string]$Category,
        [string]$CheckName,
        [bool]$Passed,
        [string]$Message
    )

    $status = if ($Passed) { "PASS" } else { "WARN" }
    $results.Add([PSCustomObject]@{
            category = $Category
            check    = $CheckName
            status   = $status
            message  = $Message
        })
    Write-Host "[$status] $CheckName -> $Message"
}

function Test-PathItem {
    param(
        [Parameter(Mandatory = $true)][string]$RelativePath,
        [Parameter(Mandatory = $true)][string]$Description,
        [Parameter(Mandatory = $true)][string]$Category
    )

    $fullPath = Join-Path $RepoRoot $RelativePath
    $exists = Test-Path $fullPath
    Add-CheckResult -Category $Category -CheckName $Description -Passed $exists -Message $RelativePath
}

function Get-FirstMatch {
    param(
        [Parameter(Mandatory = $true)][string]$FilePath,
        [Parameter(Mandatory = $true)][string]$Pattern
    )

    if (-not (Test-Path $FilePath)) {
        return $null
    }

    $content = Get-Content -Path $FilePath -Raw -Encoding UTF8
    $match = [regex]::Match($content, $Pattern, [System.Text.RegularExpressions.RegexOptions]::Multiline)
    if (-not $match.Success) {
        return $null
    }

    return $match.Groups[1].Value
}

Write-Host "== Template Health Check =="
Write-Host "RepoRoot: $RepoRoot"

# 1) Paths: specifications and task coverage
Test-PathItem -RelativePath "specs/requirements" -Description "requirements directory exists" -Category "paths"
Test-PathItem -RelativePath "specs/design" -Description "design directory exists" -Category "paths"
Test-PathItem -RelativePath "specs/acceptance" -Description "acceptance directory exists" -Category "paths"

# 2) Paths: memory write-back evidence
Test-PathItem -RelativePath "memory/index.md" -Description "memory index exists" -Category "paths"
Test-PathItem -RelativePath "memory/timeline.md" -Description "memory timeline exists" -Category "paths"
Test-PathItem -RelativePath "memory/entries" -Description "memory entries directory exists" -Category "paths"

# 3) Paths: architecture and contracts
Test-PathItem -RelativePath "docs/01-architecture/decision-records" -Description "ADR directory exists" -Category "paths"
Test-PathItem -RelativePath "specs/contracts" -Description "contracts directory exists" -Category "paths"
Test-PathItem -RelativePath "docs/02-interfaces/overview.md" -Description "interfaces overview exists" -Category "paths"
Test-PathItem -RelativePath "docs/09-operations/template-health-check.md" -Description "health-check doc exists" -Category "paths"

# 4) ID consistency check for demo chain
$reqFile = Join-Path $RepoRoot "specs/requirements/REQ-001-minimal-template-flow.md"
$desFile = Join-Path $RepoRoot "specs/design/DES-001-minimal-template-flow.md"
$accFile = Join-Path $RepoRoot "specs/acceptance/ACC-001-minimal-template-flow.md"

$reqContent = if (Test-Path $reqFile) { Get-Content -Path $reqFile -Raw -Encoding UTF8 } else { "" }
$desContent = if (Test-Path $desFile) { Get-Content -Path $desFile -Raw -Encoding UTF8 } else { "" }
$accContent = if (Test-Path $accFile) { Get-Content -Path $accFile -Raw -Encoding UTF8 } else { "" }

$reqLinkOk = ($reqContent -match 'REQ-001') -and ($desContent -match 'REQ-001') -and ($accContent -match 'REQ-001')
Add-CheckResult -Category "id-link" -CheckName "REQ linkage is consistent" -Passed $reqLinkOk -Message "REQ-001 should appear in REQ/DES/ACC"

$desLinkOk = ($accContent -match 'DES-001')
Add-CheckResult -Category "id-link" -CheckName "ACC links to DES-001" -Passed $desLinkOk -Message "Acceptance should reference DES-001"

$accLinkOk = ($desContent -match 'ACC-001')
Add-CheckResult -Category "id-link" -CheckName "DES links to ACC-001" -Passed $accLinkOk -Message "Design should reference ACC-001"

# 5) Eval existence check for demo chain
$evalFile = Join-Path $RepoRoot "tests/evals/critical/eval-0001-minimal-flow.yaml"
$evalExists = Test-Path $evalFile
Add-CheckResult -Category "eval" -CheckName "critical eval sample exists" -Passed $evalExists -Message "tests/evals/critical/eval-0001-minimal-flow.yaml"

$allPassed = -not ($results | Where-Object { $_.status -eq "WARN" })

$reportFullPath = Join-Path $RepoRoot $ReportPath
$reportDir = Split-Path -Path $reportFullPath -Parent
if (-not (Test-Path $reportDir)) {
    New-Item -ItemType Directory -Path $reportDir | Out-Null
}

$report = [PSCustomObject]@{
    generatedAt = (Get-Date).ToString("s")
    repoRoot    = $RepoRoot
    summary     = @{
        total = $results.Count
        pass  = @($results | Where-Object { $_.status -eq "PASS" }).Count
        warn  = @($results | Where-Object { $_.status -eq "WARN" }).Count
        status = if ($allPassed) { "PASS" } else { "WARN" }
    }
    checks      = $results
}

$report | ConvertTo-Json -Depth 6 | Set-Content -Path $reportFullPath -Encoding UTF8

Write-Host "Report: $ReportPath"
if ($allPassed) {
    Write-Host "== Result: PASS =="
    exit 0
}

Write-Host "== Result: WARN (please fix warnings listed above) =="
exit 0
