$(document).on 'turbolinks:load load', ->

  sendFile = (file, toSummernote) ->
    data = new FormData
    data.append 'upload[image]', file
    $.ajax
      data: data
      type: 'POST'
      url: '/uploads'
      cache: false
      contentType: false
      processData: false
      success: (data) ->
        toSummernote.summernote 'insertImage', data.url

  $('[data-provider="summernote"]').each ->
    $(this).summernote
      lang: 'en'
      height: 500
      callbacks: onImageUpload: (files) ->
        file = files[0]
        if file.size > 1000000
          alert 'File size must be less than 1MB'
        sendFile file, $(this)