# Long chunk we'll repeat
$chunk = "very_very_long_folder_name_that_will_cause_git_checkout_to_fail_due_to_windows_max_path_limitation_even_when_using_modern_git_clients_version_2_43_or_older"

# Build something like chunk\chunk\chunk\chunk\...
$deepRelative = ($chunk + "\") * 4   # change 4 to 5 if needed
$deepRelative = $deepRelative.TrimEnd('\')

# Full directory path under your repo
$deepDir = Join-Path (Get-Location) $deepRelative

# Create the directory tree
New-Item -ItemType Directory -Path $deepDir -Force | Out-Null

# Create a long file name inside that deep path
$file = Join-Path $deepDir "WordOvernightMemoryMonitoringTest_with_an_extremely_long_file_name_for_unc_extended_path_repro.cs"
Set-Content -Path $file -Value "class Test {}"

# Check the full path and its length
$full = [IO.Path]::GetFullPath($file)
$full
$full.Length
