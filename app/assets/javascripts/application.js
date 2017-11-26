//= require jquery
//= require jquery.turbolinks
//= require jquery-ui/widgets/sortable
//= require jquery_ujs
//= require rails.validations
//= require rails.validations.simple_form

//= require bootstrap
//= require summernote
//= require turbolinks
//= require_tree .

$(document).on('turbolinks:load load', function() {
  
  $('#summernote').summernote({
    height: 500,
    minHeight: 300,
    maxHeight: null,
    focus: false
  });
  
  if (typeof ga === "function") {
    ga("set", "location", event.data.url);
    return ga("send", "pageview");
  }
  
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