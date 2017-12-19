#= require jquery
#= require jquery-ui/widgets/sortable
#= require jquery_ujs
#= require bootstrap
#= require summernote
#= require turbolinks
#= require rails.validations
#= require rails.validations.simple_form
#= require_tree .

$(document).on 'turbolinks:load load', ->
  $('#summernote').summernote
    height: 500
    minHeight: 300
    maxHeight: null
    focus: false
    
  if typeof ga is 'function'
    ga 'set', 'location', event.data.url
    return ga('send', 'pageview')
    
  # Devise edit user password
  $('.edit-password').keyup (event) ->
    if $('.edit-password').val().length is 0
      $('.new-password-confirmation').fadeOut 'fast'
    else
      $('.new-password-confirmation').fadeIn 'fast'
    
  if $('.new-password-confirmation').hasClass('field_with_errors')
    $('.new-password-confirmation').show()