import "bootstrap";
import $ from "jquery";
import 'mapbox-gl/dist/mapbox-gl.css';

import { flipcard } from '../components/flipcard';
import { collapse } from "plugins/collapsible.js";

flipcard();
collapse();

import { flipcard } from '../components/flipcard';

import { initMapbox } from '../plugins/init_mapbox';

import { closeNav, openNav} from  "plugins/navbottom.js";

// MENU
$("#userMenuBtn").click(openNav);
$("#closeUserBtn").click(closeNav);
initMapbox();
flipcard();

