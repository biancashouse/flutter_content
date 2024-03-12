# Define current working directory
$currentDirectory = Get-Location

# Define file paths (modify as needed)
$pubspecPath = "$currentDirectory\pubspec.yaml"
$changelogPath = "$currentDirectory\CHANGELOG.md"

# Function to increment version number
function Increment-Version {
  param(
    [Parameter(Mandatory = $true)]
    [string] $versionString,
    [Parameter(Mandatory = $false)]
    [int] $patch = 1
  )

  # Split version into major, minor, patch components
  $parts = $versionString.Split('.')

  # Update patch version
  $parts[2] += $patch

  # Join components back to a string
  $newVersion = [string]::Join('.', $parts)
  return $newVersion
}

# Get current version from pubspec.yaml
$currentVersion = (Get-Content -Path $pubspecPath | Select-String -Pattern 'version: ')[0].Matches.Value.Split(':')[1].Trim()

# Increment patch version by default
$newVersion = Increment-Version -version $currentVersion

# Prompt for user input (optional)
if ($PSCmdlet.ShouldProcess('Update version number', "Current version: $currentVersion, New version: $newVersion")) {
  # Update version in pubspec.yaml
  (Get-Content -Path $pubspecPath) | Set-Content -Path $pubspecPath -Value { $_ -replace "version: $currentVersion", "version: $newVersion" }

  # Update version in CHANGELOG.md (modify pattern as needed)
  (Get-Content -Path $changelogPath) | Set-Content -Path $changelogPath -Value { $_ -replace "(## v)($currentVersion)(.*)", "## v$newVersion\2" }

  Write-Host "Version numbers updated successfully!"
} else {
  Write-Host "Version update cancelled."
}
