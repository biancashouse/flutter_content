param (
    [string]$FilePath  # The path to the YAML file passed as an argument
)

# Validate if the argument is provided
if (-not $FilePath) {
    Write-Host "Please provide the path to the YAML file as an argument."
    exit 1
}

# Read the content of the YAML file
try {
    $yamlContent = Get-Content -Path $FilePath -Raw
} catch {
    Write-Host "Error reading the file: $_"
    exit 1
}

# Extract the current version from the YAML content
$versionPattern = 'version:\s*(\d+\.\d+\.\d+)'
$currentVersion = $yamlContent | Select-String -Pattern $versionPattern | ForEach-Object { $_.Matches.Groups[1].Value }

# Increment the last component of the version
$versionComponents = $currentVersion -split '\.'
$newRevision = [int]$versionComponents[2] + 1
$newVersion = "$($versionComponents[0]).$($versionComponents[1]).$newRevision"

# Update the YAML content with the new version
$updatedYamlContent = $yamlContent -replace $versionPattern, "version: $newVersion"

# Write the updated content back to the file
try {
    $updatedYamlContent | Set-Content -Path $FilePath
    Write-Host "Version updated to $newVersion in $FilePath."
} catch {
    Write-Host "Error writing to the file: $_"
    exit 1
}
