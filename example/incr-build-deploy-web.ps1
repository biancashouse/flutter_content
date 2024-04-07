cd example

try {
    & ..\increment-version.ps1 pubspec.yaml
} catch {
    Write-Host "increment-version.ps1: $_"
    exit 1
}

try {
    & flutter build web
} catch {
    Write-Host "flutter build web failed: $_"
    exit 1
}

try {
    & firebase deploy --only hosting
} catch {
    Write-Host "firebase deploy --only hosting failed: $_"
    exit 1
}
