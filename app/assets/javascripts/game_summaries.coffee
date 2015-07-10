# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

setMessageTimeout = ->
  console.log 'setting timeout'
  window.setTimeout ->
    $("#statusMessages .alert :last-child").fadeTo(500, 0).slideUp(500, -> $(this.remove()))
  ,5000
