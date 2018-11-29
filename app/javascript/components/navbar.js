function initUpdateNavbarOnScroll() {
  const navbar = document.querySelector('.navbar-wagas');
  if (navbar) {
    window.addEventListener('scroll', () => {
      if (window.scrollY >= window.innerHeight) {
        navbar.classList.add('navbar-wagas-white');
      } else {
        navbar.classList.remove('navbar-wagas-white');
      }
    });
  }
}



export { initUpdateNavbarOnScroll };
