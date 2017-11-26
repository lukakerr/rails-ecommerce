$(document).on 'turbolinks:load load', ->
  $ ->
    $('.menubutton, .mob-menu').on 'click', (e) ->
      e.preventDefault()
      $('ul').stop().slideToggle()
    
  $('.menubutton, .mob-menu').click ->
    $('.bar').toggleClass 'open'
    $('.dropdown-nav-links').stop().slideToggle 'open'