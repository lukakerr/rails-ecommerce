$(document).on('turbolinks:load load', function() {

  checkoutPersonal = $(".checkout-personal");
  checkoutShipping = $(".checkout-shipping");
  checkoutBilling = $(".checkout-billing");
  nextButton = $(".next-button");

  // nextButton.click(function(event) {
  //   if (checkoutPersonal.is(":visible")) {
  //     checkoutPersonal.fadeOut('slow');
  //     checkoutShipping.fadeIn('slow');
  //   } else if (checkoutShipping.is(":visible")) {
  //     checkoutShipping.fadeOut('slow');
  //     checkoutBilling.fadeIn('slow');
  //   } else if (checkoutBilling.is(":visible")) {
  //     nextButton.innerHtml = "Back"
  //     checkoutBilling.fadeOut('slow');
  //     checkoutShipping.fadeOut('slow');
  //   }
  // });

  // checkoutShipping.click(function(event) {
  //   checkoutPersonal.fadeOut('slow');
  //   checkoutShipping.fadeIn('slow');
  // });

  // checkoutPersonal.click(function(event) {
  //   checkoutPersonal.fadeIn('slow');
  //   checkoutShipping.fadeOut('slow');
  // });

  // checkoutBilling.click(function(event) {
  //   checkoutBilling.fadeOut('slow');
  //   checkoutPersonal.fadeOut('slow');
  // });

});