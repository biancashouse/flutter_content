    try {
        Set-Location "example"
        & flutter build web --release -t lib/main.dart
    }
    catch {
        Write-Host "flutter build web failed: $_"
        exit 1
    }

    Set-Location "build/web"

    try {
        & python -m http.server 55555
    }
    catch {
        Write-Host "launching python web server failed: $_"
        exit 1
    }
