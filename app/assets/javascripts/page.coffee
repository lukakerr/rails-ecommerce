$(document).on 'turbolinks:load load', ->
  $('#pages-list').sortable
    axis: 'y'
    update: (event, ui) ->
      $.post $(this).data('update-url'), $(this).sortable('serialize')