function possiblyBumpVersion {
    Write-Host "Bump the pubspec version ?" -ForegroundColor DarkCyan
    Write-Host "0. don't change" -ForegroundColor Red
    Write-Host "1. breaking" -ForegroundColor Cyan
    Write-Host "2. build" -ForegroundColor Cyan
    Write-Host "3. MAJOR" -ForegroundColor Cyan
    Write-Host "4. minor" -ForegroundColor Cyan
    Write-Host "5. patch" -ForegroundColor Cyan
    Write-Host "6. pre" -ForegroundColor Cyan
    Write-Host "7. release" -ForegroundColor Cyan
    $choice = Read-Host "Enter your choice (1-7)"

    switch ($choice) {
        0 {
            Write-Host "skipped bump."
        }
        1 {
            Write-Host "Version now $(cider bump breaking)"
        }
        2 {
            Write-Host "Version now $(cider bump build)"
        }
        3 {
            Write-Host "Version now $(cider bump major)"
        }
        4 {
            Write-Host "Version now $(cider bump minor)"
        }
        5 {
            Write-Host "Version now $(cider bump patch)"
        }
        6 {
            Write-Host "Version now $(cider bump pre)"
        }
        7 {
            Write-Host "Version now $(cider bump release)"
        }
        default {
            Write-Host "Invalid choice"
        }
    }
}

function Find-HostingSiteProperty {
    $jsonContent = Get-Content -Path "firebase.json" -Raw

    $jsonObject = $jsonContent | ConvertFrom-Json

    return $jsonObject.hosting.site
}

function setIndexDotHtmlVersion {
    # assumes in project root
    param (
        [string]$templateIndexFileName,
        [string]$newVersion
    )

    if (Test-Path $templateIndexFileName) {
        $indexFilePath = "web\index.html"
        $backupFilePath = "web\index.html.jic"

        Get-Content -Path $indexFilePath -Raw | Set-Content -Path $backupFilePath
        (Get-Content -Path $templateIndexFileName -Raw).Replace('VERSION', $newVersion) | Set-Content -Path $indexFilePath

        Write-Host "web\index.html updated successfully!"
    }
    else {
        Write-Host "Error: Template file '$templateIndexFileName' not found!"
    }
}

# ########################################################################################################################
Write-Host "building then deploying webapp"
Write-Host "------------------------------"

# must start from project directory
$savedDir = (Get-Location)

# navigate to project root
while (-not (Test-Path ".git") ) {
    # Navigate to the parent directory
    Set-Location ..
    Write-Host "Navigating to: up"
}

$pubspecVersion = cider version
Write-Host "pubspec.yaml version is $pubspecVersion"

possiblyBumpVersion

$pubspecVersion = cider version

# generate new index.html form template
setIndexDotHtmlVersion "web/index.tmpl.html" $pubspecVersion
Write-Host "build version now $pubspecVersion"

# flutter clean and regenerate freezed etc
#try {
#    flutter clean
#    dart run build_runner build --delete-conflicting-outputs
#}
#catch {
#    Write-Host "flutter clean"
#    Set-Location "$savedDir"
#    exit 1
#}

# build web app for release
try {
    flutter build web --release -t lib/main.dart
}
catch {
    Write-Host "flutter build web failed: $_"
    Set-Location "$savedDir"
    exit 1
}

# deploy
try {
    Write-Host 'Deploying...'
    #$HostingSiteProperty = Find-HostingSiteProperty
    & firebase deploy --only hosting #"$HostingSiteProperty"
}
catch {
    Write-Host "firebase deploy --only hosting failed: $_"
    Set-Location "$savedDir"
    exit 1
}
Write-Host 'Deployed o.k.'

Set-Location "$savedDir"
