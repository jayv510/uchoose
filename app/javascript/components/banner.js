import Typed from 'typed.js';

function loadDynamicBannerText() {
  new Typed('#banner-typed-text', {
    strings: ["What is the food on campus like?", "How are the student organisations?", "Is it easy to get around campus?", "Is the core curriculum interesting?", "Is it difficult to get into preferred courses?","How can I prepare for the entrance interview?","What are the dormitories like?"],
    typeSpeed: 50,
    loop: true
  });
}

export { loadDynamicBannerText };
