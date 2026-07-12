$templatePath = "f:\websites with antigravity\sanskar-template.html"
$templateContent = Get-Content $templatePath -Raw

$sanskars = @(
    @{
        id = "garbhadhana"
        name = "Garbhadhana Sanskar"
        subtitle = "The Sacred Ritual of Conception"
        desc = "Complete details, importance, procedure, and booking for Garbhadhana Sanskar."
        importance = "Garbhadhana is the first of the 16 Sanskars. It is the sacred and conscious act of conception. In Sanatan Dharma, bringing a soul into the world is not an accident but a divine invocation. This ritual ensures that the parents are physically, mentally, and spiritually prepared to invite a noble soul into their womb."
        procedure = "The couple performs a Havan and prays to Prajapati and other deities for healthy progeny. The ceremony involves reciting Vedic mantras that purify the womb and create a highly positive spiritual environment for conception."
        time = "Auspicious Muhurat post-marriage"
    },
    @{
        id = "pumsavana"
        name = "Pumsavana Sanskar"
        subtitle = "Fostering the Physical and Mental Growth of the Fetus"
        desc = "Complete details, importance, procedure, and booking for Pumsavana Sanskar."
        importance = "Performed during the third month of pregnancy, Pumsavana aims to ensure the healthy physical and mental development of the fetus. It is believed that during this time, the fetus's brain begins to develop, and positive vibrations are crucial."
        procedure = "Special drops made from the Banyan tree root are administered to the mother's right nostril. Mantras are chanted for the strength and vitality of the unborn child."
        time = "3rd Month of Pregnancy"
    },
    @{
        id = "simantonnayana"
        name = "Simantonnayana Sanskar"
        subtitle = "The Vedic Baby Shower for the Mother's Well-being"
        desc = "Complete details, importance, procedure, and booking for Simantonnayana Sanskar."
        importance = "Also known as the 'Godh Bharai' or Vedic baby shower, this is performed in the 7th or 8th month of pregnancy. Its primary purpose is to keep the expectant mother in a joyful and peaceful state of mind, which directly impacts the baby's psychological development."
        procedure = "The husband gently parts the wife's hair (Simanta) using an Udumbara branch, while guests bless her with fruits, gifts, and positive words. Mantras are recited to protect the mother and child from negative energies."
        time = "7th or 8th Month of Pregnancy"
    },
    @{
        id = "jatakarma"
        name = "Jatakarma Sanskar"
        subtitle = "Welcoming the Newborn into the World"
        desc = "Complete details, importance, procedure, and booking for Jatakarma Sanskar."
        importance = "Jatakarma is performed immediately after the child is born, before the umbilical cord is cut (or as soon as possible). It welcomes the new soul into the physical world, stimulates its intellect, and initiates the bond between the father and child."
        procedure = "The father writes 'Om' on the newborn's tongue with a golden spoon dipped in honey and ghee, whispering the Gayatri Mantra into the baby's ear. This symbolizes the awakening of wisdom and sweet speech."
        time = "Immediately upon Birth"
    },
    @{
        id = "nishkramana"
        name = "Nishkramana Sanskar"
        subtitle = "The Child's First Outing"
        desc = "Complete details, importance, procedure, and booking for Nishkramana Sanskar."
        importance = "Nishkramana means 'stepping out'. It is the child's first exposure to the outside world, specifically the sun (Surya) and the moon (Chandra). This ritual introduces the child to the five elements (Panchamahabhuta) of nature."
        procedure = "The child is taken out of the house for the first time by the parents. Prayers are offered to Surya Devta for granting life, health, and brilliance to the child."
        time = "3rd or 4th Month after Birth"
    },
    @{
        id = "annaprashana"
        name = "Annaprashana Sanskar"
        subtitle = "The First Intake of Solid Food"
        desc = "Complete details, importance, procedure, and booking for Annaprashana Sanskar."
        importance = "Annaprashana marks the transition of the baby from an exclusively liquid diet to solid food. It acknowledges the child's growth and prays for good digestion, health, and a long life."
        procedure = "A Havan is performed. The child is fed sweet rice (Kheer) or mashed food for the first time by the father or maternal uncle using a silver or golden spoon."
        time = "6th Month (Boys) or 5th/7th (Girls)"
    },
    @{
        id = "chudakarana"
        name = "Chudakarana (Mundan) Sanskar"
        subtitle = "The First Haircut for Purity"
        desc = "Complete details, importance, procedure, and booking for Chudakarana Sanskar."
        importance = "Commonly known as Mundan, this ritual involves shaving the baby's first hair. The hair from birth is considered impure. Shaving it off signifies the removal of past life karmic impurities and promotes healthy growth of the brain and new hair."
        procedure = "A priest performs a Havan. The hair is shaved off, leaving a small tuft (Shikha) at the crown of the head. The shaved hair is later immersed in a holy river."
        time = "1st or 3rd Year"
    },
    @{
        id = "karnavedha"
        name = "Karnavedha Sanskar"
        subtitle = "Piercing the Ears for Health and Intellect"
        desc = "Complete details, importance, procedure, and booking for Karnavedha Sanskar."
        importance = "Ear piercing is not just for adornment. In Ayurveda, piercing the lower lobes of the ears is believed to activate specific acupressure points that enhance memory, intellect, and prevent respiratory diseases."
        procedure = "The piercing is done during an auspicious Muhurat while chanting mantras. Gold wire is typically used as gold has purifying properties."
        time = "3rd or 5th Year"
    },
    @{
        id = "vidyarambha"
        name = "Vidyarambha Sanskar"
        subtitle = "The Beginning of Alphabet Learning"
        desc = "Complete details, importance, procedure, and booking for Vidyarambha Sanskar."
        importance = "This ritual marks the child's formal initiation into learning the alphabets. It awakens the child's intellect and invokes the blessings of Goddess Saraswati (Deity of Knowledge) and Lord Ganesha (Remover of Obstacles)."
        procedure = "The child is guided to write 'Om' or the first alphabet on rice or sand spread on a tray, using their index finger or a gold ring, under the guidance of the parents and Guru."
        time = "Around 5 Years of Age"
    },
    @{
        id = "upanayana"
        name = "Upanayana Sanskar"
        subtitle = "The Sacred Thread Ceremony"
        desc = "Complete details, importance, procedure, and booking for Upanayana Sanskar."
        importance = "Upanayana is one of the most critical Sanskars. It signifies the 'second birth' (spiritual birth) of the child. The child receives the sacred thread (Yagyopavit) and the Gayatri Mantra, initiating them into formal spiritual and Vedic education."
        procedure = "The child's head is shaved, and they wear simple unstitched clothes. The Guru invests the child with the sacred thread (Janeu) and teaches them the Gayatri Mantra during a grand Havan."
        time = "8th to 12th Year"
    },
    @{
        id = "vedarambha"
        name = "Vedarambha Sanskar"
        subtitle = "Initiation into the Study of Vedas"
        desc = "Complete details, importance, procedure, and booking for Vedarambha Sanskar."
        importance = "Performed closely with Upanayana, Vedarambha marks the actual beginning of the systematic study of the Vedas and ancient scriptures under the strict guidance of a Guru in a Gurukul environment."
        procedure = "Special Havan is conducted. The student takes vows of discipline (Brahmacharya) and begins learning the Vedic mantras, starting with their specific Veda (Rig, Yajur, Sama, or Atharva)."
        time = "Immediately after Upanayana"
    },
    @{
        id = "keshanta"
        name = "Keshanta Sanskar"
        subtitle = "The First Shave of Adulthood"
        desc = "Complete details, importance, procedure, and booking for Keshanta Sanskar."
        importance = "Keshanta marks the transition from childhood to young adulthood. It is the ceremony of the first shaving of facial hair. It reminds the student to maintain inner purity and discipline as they experience physical changes."
        procedure = "The Guru performs a Havan, and the student's facial hair is shaved for the first time. The student offers a cow (Godaan) or equivalent charity to the Guru."
        time = "16th Year"
    },
    @{
        id = "samavartana"
        name = "Samavartana Sanskar"
        subtitle = "Graduation from the Gurukul"
        desc = "Complete details, importance, procedure, and booking for Samavartana Sanskar."
        importance = "This is the graduation ceremony marking the completion of formal education (Brahmacharya Ashram). The student is now considered a 'Snataka' (graduate) and is ready to return home and enter the responsibilities of family life."
        procedure = "The student takes a ceremonial bath (Snana), changes from simple student clothes to fine garments, and receives final life advice from the Guru. Dakshina is offered to the Guru."
        time = "Completion of Education"
    },
    @{
        id = "vivaha"
        name = "Vivaha Sanskar"
        subtitle = "The Sacred Bond of Marriage"
        desc = "Complete details, importance, procedure, and booking for Vivaha Sanskar."
        importance = "Vivaha is the most celebrated Sanskar, marking the entry into the Grihastha Ashram (householder life). It is a sacred, unbreakable bond uniting two souls to pursue Dharma (duty), Artha (wealth), Kama (desire), and Moksha (liberation) together."
        procedure = "Includes elaborate rituals like Kanyadaan (giving away the bride), Panigrahana (holding hands), Mangal Phera (circling the sacred fire), and Saptapadi (the seven vows)."
        time = "Adulthood"
    },
    @{
        id = "antyeshti"
        name = "Antyeshti Sanskar"
        subtitle = "The Final Rites and Cremation"
        desc = "Complete details, importance, procedure, and booking for Antyeshti Sanskar."
        importance = "Antyeshti is the final Sanskar performed after death. It returns the physical body back to the five natural elements (Panchamahabhuta) through cremation. It releases the soul from its physical attachments, allowing it to move peacefully towards its next journey."
        procedure = "The body is bathed, dressed, and placed on a pyre. The chief mourner (usually the eldest son) lights the pyre while Pandits chant specific Vedic mantras for the peace of the departed soul."
        time = "After Death"
    }
)

foreach ($sanskar in $sanskars) {
    $newContent = $templateContent -replace "Namakarana Sanskar", $sanskar.name
    $newContent = $newContent -replace "The Sacred Naming Ceremony for the Newborn", $sanskar.subtitle
    $newContent = $newContent -replace "Complete details, importance, procedure, and booking for Namakarana Sanskar \(Naming Ceremony\).", $sanskar.desc
    
    # Replace Importance Paragraph
    $newContent = $newContent -replace "The Namakarana Sanskar is the fifth among the 16 Sanatan Sanskars.*?", $sanskar.importance
    
    # Replace Procedure Paragraph
    $newContent = $newContent -replace "The ceremony is traditionally performed on the 11th or 12th day after birth. The procedure includes:", $sanskar.procedure
    
    # Replace Best Time
    $newContent = $newContent -replace "<span style=""color: var\(--text-muted\);"">11th or 12th Day</span>", "<span style=""color: var(--text-muted);"">$($sanskar.time)</span>"
    
    $outPath = "f:\websites with antigravity\$($sanskar.id).html"
    Set-Content -Path $outPath -Value $newContent -Encoding UTF8
    Write-Host "Generated $($sanskar.id).html"
}
