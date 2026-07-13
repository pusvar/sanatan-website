$descriptions = @{
    "index" = "Sanatan 16 Sanskar offers authentic Vedic rituals and expert Purohit services in Varanasi (Kashi). Book Pandits for all 16 Hindu Sanskars from birth to final rites."
    "about" = "Learn about Sanatan 16 Sanskar, our mission to preserve Vedic traditions, and our team of experienced Purohits in Varanasi providing authentic Hindu rituals."
    "contact" = "Contact Sanatan 16 Sanskar for Pandit bookings, ritual inquiries, and spiritual guidance in Varanasi. Call or WhatsApp us today for authentic Vedic services."
    "gallery" = "View our gallery showcasing authentic Vedic rituals, Puja setups, Havan Kunds, and ceremonies performed by expert Purohits in Varanasi."
    "services" = "Explore our comprehensive list of Vedic services including all 16 Sanskars, Rudrabhishek, Navagraha Shanti, and Griha Pravesh pujas in Varanasi."
    "calendar" = "Stay updated with the Hindu Panchang. Check exact dates for major Hindu fasts and festivals (Vrat & Tyohar) like Ekadashi, Shivratri, and Diwali."
    "blog" = "Read our spiritual blog to understand the deep meaning behind Hindu rituals, Vedic astrology, and the importance of the 16 Sanskars."
    "privacy" = "Privacy Policy for Sanatan 16 Sanskar. Learn how we protect your personal information when you book our Vedic services."
    "terms" = "Terms and Conditions for Sanatan 16 Sanskar. Please review our service guidelines for Pandit bookings and rituals."
    "refund" = "Refund and Cancellation Policy for Sanatan 16 Sanskar. Understand our terms for canceling or modifying your Puja bookings."
    "rudrabhishek-sawan" = "Book authentic Rudrabhishek Puja in Varanasi during the holy month of Sawan. Seek Lord Shiva's blessings with our expert Purohits."
    
    # Sanskars
    "garbhadhana" = "Complete details, importance, procedure, and expert Kashi Pandit booking for Garbhadhana Sanskar (Conception Ceremony)."
    "pumsavana" = "Complete details, importance, procedure, and expert Kashi Pandit booking for Pumsavana Sanskar (Fetus Protection Ceremony)."
    "simantonnayana" = "Complete details, importance, procedure, and expert Kashi Pandit booking for Simantonnayana Sanskar (Baby Shower Ceremony)."
    "jatakarma" = "Complete details, importance, procedure, and expert Kashi Pandit booking for Jatakarma Sanskar (Birth Ceremony)."
    "namakarana" = "Complete details, importance, procedure, and expert Kashi Pandit booking for Namakarana Sanskar (Naming Ceremony)."
    "nishkramana" = "Complete details, importance, procedure, and expert Kashi Pandit booking for Nishkramana Sanskar (First Outing Ceremony)."
    "annaprashana" = "Complete details, importance, procedure, and expert Kashi Pandit booking for Annaprashana Sanskar (First Solid Food Ceremony)."
    "chudakarana" = "Complete details, importance, procedure, and expert Kashi Pandit booking for Chudakarana (Mundan) Sanskar (Head Shaving Ceremony)."
    "karnavedha" = "Complete details, importance, procedure, and expert Kashi Pandit booking for Karnavedha Sanskar (Ear Piercing Ceremony)."
    "vidyarambha" = "Complete details, importance, procedure, and expert Kashi Pandit booking for Vidyarambha Sanskar (Learning Alphabet Ceremony)."
    "upanayana" = "Complete details, importance, procedure, and expert Kashi Pandit booking for Upanayana (Yajnopavita) Sanskar (Sacred Thread Ceremony)."
    "vedarambha" = "Complete details, importance, procedure, and expert Kashi Pandit booking for Vedarambha Sanskar (Study of Vedas Ceremony)."
    "keshanta" = "Complete details, importance, procedure, and expert Kashi Pandit booking for Keshanta Sanskar (First Haircut / Shaving Ceremony)."
    "samavartana" = "Complete details, importance, procedure, and expert Kashi Pandit booking for Samavartana Sanskar (Graduation Ceremony)."
    "vivah" = "Complete details, importance, procedure, and expert Kashi Pandit booking for Vivah Sanskar (Hindu Marriage Ceremony)."
    "antyeshti" = "Complete details, importance, procedure, and expert Kashi Pandit booking for Antyeshti Sanskar (Funeral / Last Rites Ceremony)."
    "reviews" = "Read testimonials and reviews from devotees who have experienced authentic Vedic rituals and Pandit services through Sanatan 16 Sanskar."
}

$dir = "f:\websites with antigravity"
$files = Get-ChildItem -Path $dir -Filter "*.html" -File

$Utf8NoBomEncoding = New-Object System.Text.UTF8Encoding $False

foreach ($file in $files) {
    $basename = $file.BaseName
    
    $desc = $descriptions[$basename]
    if (-not $desc) {
        $desc = "Sanatan 16 Sanskar provides authentic Vedic rituals and expert Purohit services in Varanasi."
    }

    $content = Get-Content -Path $file.FullName -Encoding UTF8
    $newContent = @()
    $modified = $false
    
    foreach ($line in $content) {
        if ($line -match '<meta name="description" content="([^"]+)">') {
            $newLine = $line -replace 'content="[^"]+"', ('content="' + $desc + '"')
            $newContent += $newLine
            $modified = $true
        } else {
            $newContent += $line
        }
    }
    
    if ($modified) {
        [System.IO.File]::WriteAllLines($file.FullName, $newContent, $Utf8NoBomEncoding)
        Write-Host "Safely updated description for: $($file.Name)"
    }
}
Write-Host "Done."
