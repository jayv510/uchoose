import "bootstrap";


import { initUpdateNavbarOnScroll } from '../components/navbar';
initUpdateNavbarOnScroll();

import { loadDynamicBannerText } from '../components/banner';
loadDynamicBannerText();



import Rails from 'rails-ujs';
Rails.start();
import {Chat} from "../components/chat.js"
