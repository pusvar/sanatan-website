$dir = "f:\websites with antigravity"
$files = Get-ChildItem -Path $dir -Filter "*.html" -File
$Utf8NoBomEncoding = New-Object System.Text.UTF8Encoding $False
$baseUrl = "https://www.sanatan16sanskar.com"

foreach ($file in $files) {
    if ($file.Name -match "sanskar-template|extracted_sanskars") { continue }
    $content = [System.IO.File]::ReadAllText($file.FullName)
    
    # 1. Update Lang
    $content = $content -replace '<html lang="en">', '<html lang="en-IN">'
    
    # 2. Extract Title and Description
    $title = "Sanatan 16 Sanskar"
    $desc = "Authentic Vedic rituals and Pandit services in Varanasi."
    
    if ($content -match '<title>(.*?)</title>') { $title = $matches[1] }
    if ($content -match '<meta name="description" content="(.*?)">') { $desc = $matches[1] }
    
    $url = "$baseUrl/$($file.Name)"
    if ($file.Name -eq "index.html") { $url = "$baseUrl/" }
    
    # 3. Inject SEO Head tags
    $seoHead = @"
    <!-- SEO Technical Tags -->
    <link rel="canonical" href="$url">
    <meta property="og:title" content="$title">
    <meta property="og:description" content="$desc">
    <meta property="og:url" content="$url">
    <meta property="og:type" content="website">
    <meta property="og:image" content="$baseUrl/assets/images/gallery-real-1.jpg">
    <meta name="twitter:card" content="summary_large_image">
    <meta name="twitter:title" content="$title">
    <meta name="twitter:description" content="$desc">
    <meta name="twitter:image" content="$baseUrl/assets/images/gallery-real-1.jpg">
"@
    
    # Remove old SEO tags if we are running this multiple times to prevent duplication
    $content = $content -replace '(?s)<!-- SEO Technical Tags -->.*?<meta name="twitter:image".*?>\s*', ''
    $content = $content -replace '</head>', "$seoHead`n</head>"
    
    # 4. Inject Schema
    $schemaType = if ($file.Name -eq "index.html" -or $file.Name -eq "about.html" -or $file.Name -eq "contact.html") { "LocalBusiness" } else { "Service" }
    
    $schemaJson = ""
    if ($schemaType -eq "LocalBusiness") {
        $schemaJson = @"
    <!-- Schema Markup -->
    <script type="application/ld+json">
    {
      "@context": "https://schema.org",
      "@type": "LocalBusiness",
      "name": "Sanatan 16 Sanskar",
      "image": "$baseUrl/assets/images/logo.png",
      "@id": "$baseUrl",
      "url": "$baseUrl",
      "telephone": "+91-1234567890",
      "address": {
        "@type": "PostalAddress",
        "streetAddress": "Varanasi Ghats",
        "addressLocality": "Varanasi",
        "addressRegion": "UP",
        "postalCode": "221001",
        "addressCountry": "IN"
      },
      "geo": {
        "@type": "GeoCoordinates",
        "latitude": 25.3176,
        "longitude": 83.0062
      },
      "priceRange": "₹₹",
      "description": "$desc"
    }
    </script>
"@
    } else {
        $schemaJson = @"
    <!-- Schema Markup -->
    <script type="application/ld+json">
    {
      "@context": "https://schema.org",
      "@type": "Service",
      "serviceType": "$title",
      "provider": {
        "@type": "LocalBusiness",
        "name": "Sanatan 16 Sanskar",
        "image": "$baseUrl/assets/images/logo.png"
      },
      "areaServed": {
        "@type": "City",
        "name": "Varanasi"
      },
      "description": "$desc",
      "url": "$url"
    }
    </script>
"@
    }

    # Remove old Schema tags
    $content = $content -replace '(?s)<!-- Schema Markup -->.*?</script>\s*', ''
    $content = $content -replace '</body>', "$schemaJson`n</body>"
    
    [System.IO.File]::WriteAllText($file.FullName, $content, $Utf8NoBomEncoding)
    Write-Host "Injected SEO into $($file.Name)"
}
