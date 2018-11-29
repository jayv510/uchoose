// import { loadDynamicBannerText } from '../components/banner';
// loadDynamicBannerText();

import "bootstrap";
import {Chat} from "components/chat.js"

document.addEventListener("DOMContentLoaded", () => {
  if (document.querySelector(".chat")) {
    window.chat = new Chat();
  }
});

import { initUpdateNavbarOnScroll } from '../components/navbar';
initUpdateNavbarOnScroll();

import { loadDynamicBannerText } from '../components/banner';
loadDynamicBannerText();


