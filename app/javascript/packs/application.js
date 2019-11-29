import "bootstrap";
import 'mapbox-gl/dist/mapbox-gl.css';

import $ from "jquery";
import { collapse } from "plugins/collapsible.js";
import { flipcard } from '../components/flipcard';
import { confetti } from '../components/confetti';
import { initMapbox } from '../plugins/init_mapbox';
import { closeNav, openNav} from  "plugins/navbottom.js";
import '../plugins/fadeinscrool'

// MENU
document.getElementById(userMenuBtn)

$("#userMenuBtn").click(openNav);
$("#closeUserBtn").click(closeNav);
initMapbox();
flipcard();
collapse();
confetti();
