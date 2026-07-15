$baseUrl = "https://www.sanatan16sanskar.com"
$dir = "f:\websites with antigravity"
$files = Get-ChildItem -Path $dir -Filter "*.html" -File

$sitemap = '<?xml version="1.0" encoding="UTF-8"?>' + "`n"
$sitemap += '<urlset xmlns="http://www.sitemaps.org/schemas/sitemap/0.9">' + "`n"

$date = (Get-Date).ToString("yyyy-MM-dd")

foreach ($file in $files) {
    # Skip template file or temporary files
    if ($file.Name -match "sanskar-template|extracted_sanskars") { continue }
    
    $url = "$baseUrl/$($file.Name)"
    
    # Priority logic
    $priority = "0.8"
    if ($file.Name -eq "index.html") { 
        $url = "$baseUrl/"
        $priority = "1.0" 
    }
    
    $sitemap += "  <url>`n"
    $sitemap += "    <loc>$url</loc>`n"
    $sitemap += "    <lastmod>$date</lastmod>`n"
    $sitemap += "    <priority>$priority</priority>`n"
    $sitemap += "  </url>`n"
}

$sitemap += "</urlset>"

$Utf8NoBomEncoding = New-Object System.Text.UTF8Encoding $False
[System.IO.File]::WriteAllLines("$dir\sitemap.xml", $sitemap, $Utf8NoBomEncoding)

$robotsTxt = "User-agent: *`nAllow: /`n`nSitemap: $baseUrl/sitemap.xml"
[System.IO.File]::WriteAllLines("$dir\robots.txt", $robotsTxt, $Utf8NoBomEncoding)

Write-Host "sitemap.xml and robots.txt created successfully."
