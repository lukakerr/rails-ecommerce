$(document).on 'turbolinks:load load', ->

  form = document.getElementById('checkout-form')

  if form?
    # Replace with your pk key - this one won't work
    stripe = Stripe('pk_test_abcdefg')
    elements = stripe.elements()

    # Custom styling can be passed to options when creating an Element.
    style = base:
      fontSize: '16px'
      color: '#32325d'
    # Create an instance of the card Element
    card = elements.create('card', style: style)
    # Add an instance of the card Element into the `card-element` <div>
    card.mount '#card-element'

    card.addEventListener 'change', (event) ->
      displayError = document.getElementById('card-errors')
      if event.error
        displayError.textContent = event.error.message
      else
        displayError.textContent = ''
      return

    # Create a token or display an error when the form is submitted.
    form.addEventListener 'submit', (event) ->
      event.preventDefault()
      stripe.createToken(card).then (result) ->
        if result.error
          # Inform the customer that there was an error
          errorElement = document.getElementById('card-errors')
          errorElement.textContent = result.error.message
        else
          # Send the token to your server
          stripeTokenHandler result.token
        return
      return

    stripeTokenHandler = (token) ->
      # Insert the token ID into the form so it gets submitted to the server
      form = document.getElementById('checkout-form')
      hiddenInput = document.createElement('input')
      hiddenInput.setAttribute 'type', 'hidden'
      hiddenInput.setAttribute 'name', 'stripeToken'
      hiddenInput.setAttribute 'value', token.id
      form.appendChild hiddenInput
      # Submit the form
      form.submit()
      return