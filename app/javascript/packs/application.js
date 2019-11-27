import "bootstrap";
import $ from "jquery";
import { closeNav, openNav} from  "plugins/navbottom.js";

// MENU
$("#userMenuBtn").click(openNav);
$("#closeUserBtn").click(closeNav);