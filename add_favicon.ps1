$dir = "f:\websites with antigravity"
$files = Get-ChildItem -Path $dir -Filter "*.html" -File
$Utf8NoBomEncoding = New-Object System.Text.UTF8Encoding $False

foreach ($file in $files) {
    if ($file.Name -match "sanskar-template|extracted_sanskars") { continue }
    $content = [System.IO.File]::ReadAllText($file.FullName)
    
    $faviconTag = '    <link rel="icon" href="assets/images/logo.png" type="image/png">'
    
    if (-not ($content -match '<link rel="icon"')) {
        $content = $content -replace '</title>', "</title>`n$faviconTag"
        [System.IO.File]::WriteAllText($file.FullName, $content, $Utf8NoBomEncoding)
        Write-Host "Added favicon to $($file.Name)"
    }
}
