# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).ready ->
  $("span[data-time]").each (index, el) ->
    date = new Date( $(el).attr "data-time" or $(el).text() )
    $(el).text(date.toString())