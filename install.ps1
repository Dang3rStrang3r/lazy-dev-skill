# lazy-dev install script for Windows
# Usage: .\install.ps1

$ErrorActionPreference = "Stop"

$RepoUrl = "https://github.com/Dang3rStrang3r/lazy-dev-skill.git"
$SkillName = "lazy-dev"

Write-Host "Installing $SkillName..." -ForegroundColor Cyan

$Targets = @(
    @{ Name = "Claude Code"; Path = "$env:USERPROFILE\.claude\skills\$SkillName" },
    @{ Name = "Cursor";      Path = "$env:USERPROFILE\.cursor\skills\$SkillName" },
    @{ Name = "Gemini CLI";  Path = "$env:USERPROFILE\.gemini\skills\$SkillName" }
)

$Installed = 0

foreach ($Target in $Targets) {
    $ParentDir = Split-Path $Target.Path -Parent

    if (Test-Path $ParentDir) {
        Write-Host "  -> $($Target.Name): $($Target.Path)" -ForegroundColor Green

        if (Test-Path $Target.Path) {
            Remove-Item -Recurse -Force $Target.Path
        }

        git clone --quiet $RepoUrl $Target.Path
        $Installed++
    } else {
        Write-Host "  -- $($Target.Name): not found, skipping" -ForegroundColor DarkGray
    }
}

if ($Installed -eq 0) {
    Write-Host ""
    Write-Host "No supported agent found." -ForegroundColor Yellow
    Write-Host "Install Claude Code, Cursor, or Gemini CLI first, or clone manually:" -ForegroundColor Yellow
    Write-Host "  git clone $RepoUrl <your-skills-dir>/$SkillName" -ForegroundColor Yellow
    exit 1
}

Write-Host ""
Write-Host "Done. Installed to $Installed location(s)." -ForegroundColor Cyan