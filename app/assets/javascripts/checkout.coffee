$(document).on 'turbolinks:load load', ->
  next_billing = $(".checkout-next-billing")
  next_shipping = $(".checkout-next-shipping")
  next_payment = $(".checkout-next-payment")

  checkout_personal = $(".checkout-personal")
  checkout_billing = $(".checkout-billing")
  checkout_shipping = $(".checkout-shipping")
  checkout_payment = $(".checkout-payment")

  checkout_personal_title = $(".personal-details-title")
  checkout_billing_title = $(".billing-details-title")
  checkout_shipping_title = $(".shipping-details-title")
  checkout_payment_title = $(".payment-details-title")

  use_billing_address = $("#use_billing_as_shipping")
  ship_another_address = $("#ship_another_address")

  current_section = checkout_personal

  submit_button = $("#checkout-form input[type=submit]")

  init = ->
    submit_button.prop("disabled", true)
    submit_button.hide()
    checkout_billing.hide()
    checkout_shipping.hide()
    checkout_payment.hide()
    next_billing.prop("disabled", true)

  empty_fields = ->
    '' in (field.value for field in current_section.find(".input :input"))

  validation_errors = ->
    current_section.find("span.error").length > 0

  next_billing.click ->
    # No empty fields and no validation errors
    if !empty_fields() and !validation_errors()
      checkout_personal.hide()
      checkout_billing.show()
      current_section = checkout_billing

  next_shipping.click ->
    validate_empty()
    if not $("span.error")[0]
      # Use billing address as shipping
      if $("#checkout-form input[type='radio']:checked").val() == "yes"
        checkout_billing.hide()
        checkout_payment.show()
        current_section = checkout_payment
      # Different shipping address
      else
        checkout_billing.hide()
        checkout_shipping.show()
        current_section = checkout_shipping

  current_section.keyup ->
    if !empty_fields() and !validation_errors()
      next_billing.prop("disabled", false)
    else
      next_billing.prop("disabled", true)

  current_section.change ->
    if !empty_fields() and !validation_errors()
      next_billing.prop("disabled", false)
    else
      next_billing.prop("disabled", true)

  init()