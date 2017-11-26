$(document).on('turbolinks:load load', function() {
  
  var sendFile = function(file, toSummernote) {
    var data;
    data = new FormData;
    data.append('upload[image]', file);
    console.log(file);
    return $.ajax({
      data: data,
      type: 'POST',
      url: '/uploads',
      cache: false,
      contentType: false,
      processData: false,
      success: function(data) {
        return toSummernote.summernote("insertImage", data.url);
      }
    });
  };

  $('[data-provider="summernote"]').each(function() {
    console.log('here');
    return $(this).summernote({
      lang: 'en',
      height: 500,
      callbacks: {
        onImageUpload: function(files) {
          file = files[0];
          if (file.size > 1000000) {
            alert("File size must be less than 1MB");
            return
          }
          return sendFile(file, $(this));
        }
      }
    });
  });

});
