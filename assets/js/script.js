document.addEventListener('DOMContentLoaded', () => {
    // 1. Navbar Scroll Effect
    const navbar = document.querySelector('.navbar');
    
    window.addEventListener('scroll', () => {
        if (window.scrollY > 50) {
            navbar.style.boxShadow = '0 8px 24px rgba(255, 111, 0, 0.12)';
            navbar.style.padding = '10px 0';
        } else {
            navbar.style.boxShadow = '0 2px 8px rgba(255, 111, 0, 0.08)';
            navbar.style.padding = '16px 0';
        }
        
        // Active Navigation Link Update
        let current = '';
        const sections = document.querySelectorAll('section');
        const navLinks = document.querySelectorAll('.nav-links a');
        
        sections.forEach(section => {
            const sectionTop = section.offsetTop;
            const sectionHeight = section.clientHeight;
            if (scrollY >= (sectionTop - sectionHeight / 3)) {
                current = section.getAttribute('id');
            }
        });

        navLinks.forEach(link => {
            link.classList.remove('active');
            if (link.getAttribute('href').includes(current)) {
                link.classList.add('active');
            }
        });
    });

    // 2. Mobile Menu Toggle (Basic implementation)
    const mobileBtn = document.querySelector('.mobile-menu-btn');
    const navLinksContainer = document.querySelector('.nav-links');
    
    mobileBtn.addEventListener('click', () => {
        // Simple toggle for demonstration. 
        // In a real app, we'd add proper classes for a slide-out menu.
        if (navLinksContainer.style.display === 'flex') {
            navLinksContainer.style.display = 'none';
        } else {
            navLinksContainer.style.display = 'flex';
            navLinksContainer.style.flexDirection = 'column';
            navLinksContainer.style.position = 'absolute';
            navLinksContainer.style.top = '100%';
            navLinksContainer.style.left = '0';
            navLinksContainer.style.width = '100%';
            navLinksContainer.style.backgroundColor = '#fff';
            navLinksContainer.style.padding = '20px';
            navLinksContainer.style.boxShadow = '0 8px 24px rgba(0,0,0,0.1)';
        }
    });

    // 3. FAQ Accordion
    const faqItems = document.querySelectorAll('.faq-item');
    
    faqItems.forEach(item => {
        const question = item.querySelector('.faq-question');
        
        question.addEventListener('click', () => {
            // Close all other items
            faqItems.forEach(otherItem => {
                if (otherItem !== item) {
                    otherItem.classList.remove('active');
                }
            });
            
            // Toggle current item
            item.classList.toggle('active');
        });
    });

    // 4. Booking Form Submission (WhatsApp Integration)
    const bookingForm = document.getElementById('puja-booking-form');
    if (bookingForm) {
        bookingForm.addEventListener('submit', (e) => {
            e.preventDefault();
            const submitBtn = bookingForm.querySelector('button[type="submit"]');
            const originalText = submitBtn.innerHTML;
            
            submitBtn.textContent = 'Redirecting to WhatsApp...';
            submitBtn.style.opacity = '0.8';
            
            // Get form values
            const name = document.getElementById('booking-name').value;
            const phone = document.getElementById('booking-phone').value;
            const city = document.getElementById('booking-city').value;
            const service = document.getElementById('booking-service').value;
            const date = document.getElementById('booking-date').value;
            
            // Format WhatsApp Message
            const message = `Hari Om! I would like to book a Sanskar/Puja.\n\n*Name:* ${name}\n*Mobile:* ${phone}\n*City:* ${city}\n*Service:* ${service}\n*Preferred Date:* ${date}`;
            
            // Open WhatsApp in new tab
            const whatsappUrl = `https://wa.me/919335162788?text=${encodeURIComponent(message)}`;
            window.open(whatsappUrl, '_blank');
            
            // Reset form UI after short delay
            setTimeout(() => {
                bookingForm.reset();
                submitBtn.innerHTML = originalText;
                submitBtn.style.opacity = '1';
            }, 2000);
        });
    }

    // 5. Language Switcher Mock
    const langBtns = document.querySelectorAll('.lang-switch button');
    langBtns.forEach(btn => {
        btn.addEventListener('click', () => {
            langBtns.forEach(b => b.classList.remove('active'));
            btn.classList.add('active');
            // Here you would trigger language translation logic
        });
    });
});
