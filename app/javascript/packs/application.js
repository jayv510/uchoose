import "bootstrap";

import Rails from 'rails-ujs';
Rails.start();
import {Chat} from "components/chat.js"
import "components/video.js"

import { initUpdateNavbarOnScroll } from '../components/navbar';
initUpdateNavbarOnScroll();

import { loadDynamicBannerText } from '../components/banner';
loadDynamicBannerText();

function sortMentor() {
  cards = document.getElements('card')
  console.log(cards)
}
