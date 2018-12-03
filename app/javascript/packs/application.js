// import { loadDynamicBannerText } from '../components/banner';
// loadDynamicBannerText();

import "bootstrap";
import {Chat} from "components/chat.js"

import { initUpdateNavbarOnScroll } from '../components/navbar';
initUpdateNavbarOnScroll();

import { loadDynamicBannerText } from '../components/banner';
loadDynamicBannerText();

function sortMentor() {
  cards = document.getElements('card')
  console.log(cards)
}
