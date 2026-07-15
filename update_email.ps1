$dir = "f:\websites with antigravity"
$files = Get-ChildItem -Path $dir -Filter "*.html" -File
$Utf8NoBomEncoding = New-Object System.Text.UTF8Encoding $False

foreach ($file in $files) {
    $content = [System.IO.File]::ReadAllText($file.FullName)
    if ($content -match "namaste@sanatansanskar.com") {
        $content = $content -replace "namaste@sanatansanskar.com", "info@sanatan16sanskar.com"
        [System.IO.File]::WriteAllText($file.FullName, $content, $Utf8NoBomEncoding)
        Write-Host "Updated $($file.Name)"
    }
}
