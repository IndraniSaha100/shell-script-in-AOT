document.querySelector('.cta-btn').addEventListener('click', () => {
    alert('Registrations for Kshitij 2025 are now open!');
  });
  
  // Smooth scrolling for navigation links
  document.querySelectorAll('nav a').forEach(link => {
    link.addEventListener('click', (e) => {
      e.preventDefault();
      document.querySelector(link.getAttribute('href')).scrollIntoView({ behavior: 'smooth' });
    });
  });
    // Animate the hero section
    gsap.from(".hero h1", { 
        opacity: 0, 
        y: -50, 
        duration: 1.5, 
        ease: "power3.out" 
      });
      
      gsap.from(".hero p", { 
        opacity: 0, 
        y: 50, 
        duration: 1.5, 
        delay: 0.5, 
        ease: "power3.out" 
      });
      
      gsap.from(".cta-btn", { 
        opacity: 0, 
        scale: 0.8, 
        duration: 1.2, 
        delay: 1, 
        ease: "elastic.out(1, 0.5)" 
      });
      
      // Animate the event cards
      gsap.from(".card", { 
        opacity: 0, 
        y: 50, 
        duration: 1, 
        stagger: 0.3, 
        delay: 1.5 
      });