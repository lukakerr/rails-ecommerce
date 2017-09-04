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
      $(".user_password_confirmation").fadeOut('fast');
    } else {
      $(".user_password_confirmation").fadeIn('fast');
    }
  });

  if ($(".user_password_confirmation").hasClass("field_with_errors")) {
    $(".user_password_confirmation").show();
  }

});