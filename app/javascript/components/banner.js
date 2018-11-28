import Typed from 'typed.js';

function loadDynamicBannerText() {
  new Typed('#banner-typed-text', {
    strings: ["Connect with university students", "Learn more about your majors"],
    typeSpeed: 50,
    loop: true
  });
}

export { loadDynamicBannerText };
