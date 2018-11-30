// import { loadDynamicBannerText } from '../components/banner';
// loadDynamicBannerText();

import "bootstrap";
import {Chat} from "components/chat.js"


import { initUpdateNavbarOnScroll } from '../components/navbar';
initUpdateNavbarOnScroll();

import { loadDynamicBannerText } from '../components/banner';
loadDynamicBannerText();

document.getElementById('startChat').addEventListener("click", () => {
  // document.getElementById('modalWindow').removeClass('hide');
  if (document.querySelector(".chat")) {
      window.chat = new Chat();
    }
});

