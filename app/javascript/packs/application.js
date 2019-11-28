import "bootstrap";

import { flipcard } from '../components/flipcard';
import { collapse } from "plugins/collapsible.js";

flipcard();
collapse();

import 'mapbox-gl/dist/mapbox-gl.css';

import { initMapbox } from '../plugins/init_mapbox';

initMapbox();
import $ from "jquery";
import { closeNav, openNav} from  "plugins/navbottom.js";

// MENU
$("#userMenuBtn").click(openNav);
$("#closeUserBtn").click(closeNav);

