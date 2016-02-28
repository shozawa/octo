# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$ ->
  # Configure infinite table
    $('.infinite-posts').infinitePages
      context: ".posts"
      debug: true
      loading: ->
        $(this).attr({href : $("a[rel=next]").attr("href")})
        $(this).text('Loading next page...')
      error: ->
        $(this).text("Trouble! Please drink some coconut water and click again")
