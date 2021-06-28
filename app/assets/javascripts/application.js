// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require rails-ujs
//= require_tree .
//= require gmaps/google

var drop2open = 0;
function drop2(evt) {
if (drop2open == 0) {
document.getElementById('menu2').style.display="block";
document.getElementById('topmenu').classList.toggle("change");
drop2open = 1; }
else {
hide2(); } }

function hide2() {
if (drop2open == 1) {
document.getElementById('menu2').style.display="none";
document.getElementById('topmenu').classList.toggle("change");
drop2open = 0; } }
