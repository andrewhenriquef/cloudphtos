# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

@update_title = (photo) ->
  $.ajax
    type: 'PUT'
    url: "/photos/#{photo}/update_title"
    data: photo_title: $('#title-field').val()
  $('#description').text($('#title-field').val())
  hide_form_description()
  return


@show_form_description = ->
  $('#form-description').show()
  $('#span-description').hide()
  return


@hide_form_description = ->
  $('#span-description').show()
  $('#form-description').hide()
  return
