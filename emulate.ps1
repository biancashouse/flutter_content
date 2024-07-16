$currentLocation = (Get-Location).Path

if ( !$currentLocation.EndsWith("example") ) {
    Set-Location "example"
}

try {
    ~\my\code\ps1\emulate.ps1
}
catch {
    Write-Host "oops: $_"
    exit 1
}
