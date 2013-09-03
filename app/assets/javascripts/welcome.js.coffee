# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$ ->
  bg = $('.lightbox-bg')
  box1 = $('.lightbox-box1')
  box2 = $('.lightbox-box2')

  bg.on 'click', ->
    box2.fadeOut()
    box1.fadeOut()
    bg.fadeOut()

  $('#create-new-account').on 'click', ->
    bg.fadeIn()
    box1.fadeIn()

  $('#login-account').on 'click', ->
  	bg.fadeIn()
  	box2.fadeIn()

  	box2.offset
	    top: 200
