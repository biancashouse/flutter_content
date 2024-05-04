try {
    & firebase emulators:start --only firestore
} catch {
    Write-Host "firebase emulator failed to start! - $_"
    exit 1
}
