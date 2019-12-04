import "bootstrap";
import 'mapbox-gl/dist/mapbox-gl.css';
import '../plugins/fadeinscrool'

import $ from "jquery";
import { collapse } from "plugins/collapsible.js";
import { flipcard } from '../components/flipcard';
import { confetti } from '../components/confetti';
import { initMapbox } from '../plugins/init_mapbox';
import { closeNav, openNav} from  "plugins/navbottom.js";
// import { addGeoloc } from '../plugins/init_mapbox';

// MENU
document.getElementById(userMenuBtn);
$("#userMenuBtn").click(openNav);
$("#closeUserBtn").click(closeNav);
initMapbox();
flipcard();
collapse();
// addGeoloc();

