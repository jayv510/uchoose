import Typed from 'typed.js';

function loadDynamicBannerText() {
  new Typed('#banner-typed-text', {
    strings: "One on one experience",
    typeSpeed: 50,
    loop: true
  });
}

export { loadDynamicBannerText };
