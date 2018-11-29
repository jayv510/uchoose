// import { loadDynamicBannerText } from '../components/banner';
// loadDynamicBannerText();

import "bootstrap";
import {Chat} from "components/chat.js"

document.getElementById('startChat').addEventListener("click", () => {
  // document.getElementById('modalWindow').removeClass('hide');
  if (document.querySelector(".chat")) {
      window.chat = new Chat();
    }
});

import { initUpdateNavbarOnScroll } from '../components/navbar';
initUpdateNavbarOnScroll();


