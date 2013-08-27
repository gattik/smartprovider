# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$ ->
	$('.complete-task').click ->
		tr = $(this).parent()
		id = tr.data('task-id')
		$.ajax
			url: "/follow_ups/#{id}/complete.json"
			success: ->
				tr.fadeOut('fast')