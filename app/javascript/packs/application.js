import "bootstrap";
import {Chat} from "components/chat.js"
// import { loadDynamicBannerText } from '../components/banner';
// loadDynamicBannerText();

document.addEventListener("DOMContentLoaded", () => {
  if (document.querySelector(".chat")) {
    window.chat = new Chat();
  }
});
