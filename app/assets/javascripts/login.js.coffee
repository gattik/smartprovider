# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).ready ->
  bg = $('.lightbox-bg')
  box = $('.lightbox-box')

  bg.on 'click', ->
    box.fadeOut()
    bg.fadeOut()

  $('.text-muted').on 'click', ->
    bg.fadeIn()
    box.fadeIn()