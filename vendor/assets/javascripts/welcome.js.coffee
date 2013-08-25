# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$ ->
  $("#modaltrigger").leanModal
    top: 110
    overlay: 0.45
    closeButton: ".hidemodal"
  $("#modaltrigger2").leanModal
    top: 5
    bottom: 25
    overlay: 0.45
    closeButton: ".hidemodal"