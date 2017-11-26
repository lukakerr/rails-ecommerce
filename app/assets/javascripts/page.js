$(document).on('turbolinks:load load', function() {
  $("#pages-list").sortable({
    axis: "y",
    update: function( event, ui ) {
      $.post($(this).data('update-url'), $(this).sortable('serialize'));
    }
  });
});