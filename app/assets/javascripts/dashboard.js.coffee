# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
ready = ->
  $('#date_picker input').datepicker
    format: 'yyyy-mm-dd'
  $('#start_date_picker input').datepicker
    format: 'yyyy-mm-dd'
  $('#end_date_picker input').datepicker
    format: 'yyyy-mm-dd'
  $('.add-team-form').hide()
  $('#add-team-btn').click ->
  	event.preventDefault()
  	$('#add-team-btn').hide()
  	$('.add-team-form').fadeIn(600)
  $('#close-form').click ->
  	$('.add-team-form').hide()
  	$('#add-team-btn').fadeIn(600)
  return

$(document).ready(ready)
$(document).on('page:load', ready)
