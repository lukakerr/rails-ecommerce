//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require rails.validations
//= require rails.validations.simple_form
// = require_tree .
$(document).on('turbolinks:load load', function() {

  // Devise edit user password
  $(".edit-password").keyup(function(event) {
    if ($(".edit-password").val().length == 0) {
      $(".new-password-confirmation").fadeOut('fast');
    } else {
      $(".new-password-confirmation").fadeIn('fast');
    }
  });

  if ($(".new-password-confirmation").hasClass("field_with_errors")) {
    $(".new-password-confirmation").show();
  }

});