$(document).on "turbolinks:load load page:change", ->
  
  clearInterval interval
  
  numberofImgs = $(".image-gallery-links > a").length
  
  if numberofImgs isnt 1
    interval = setInterval(loopImages, 5000)
  
  currentImgNumber = 1
  nextImgNumber = currentImgNumber + 1
  previousImgNumber = numberofImgs
  randomImgNumber = 3
  currentImg = $(".image-gallery div img:nth-of-type(#{currentImgNumber})")
  nextImg = $(".image-gallery div img:nth-of-type(#{nextImgNumber})")
  previousImg = $(".image-gallery div img:nth-of-type(#{previousImgNumber})")
  randomImg = $(".image-gallery div img:nth-of-type(#{randomImgNumber})")

  init = ->
    loadImg()
    boldText()

  loadImg = ->
    currentImg.stop().fadeTo "slow", 1

  nextImgFade = ->
    currentImg.stop().fadeTo "slow", 0
    nextImg.stop().fadeTo "slow", 1

  previousImgFade = ->
    currentImg.stop().fadeTo "slow", 0
    previousImg.stop().fadeTo "slow", 1

  randomImgFade = ->
    currentImg.stop().fadeTo "slow", 0
    randomImg.stop().fadeTo "slow", 1

  boldText = ->
    $(".image-gallery-links a").each ->
      currentHref = parseInt($(this).attr("href"))
      if currentImgNumber is currentHref
        $(this).css "font-weight", "600"
      else
        $(this).css "font-weight", "200"

  imgLoop = ->
    if currentImgNumber is 1
      nextImgNumber = currentImgNumber + 1
      previousImgNumber = numberofImgs
    else if currentImgNumber is numberofImgs
      nextImgNumber = 1
      previousImgNumber = currentImgNumber - 1
    else
      nextImgNumber = currentImgNumber + 1
      previousImgNumber = currentImgNumber - 1

  refreshImgs = ->
    currentImg = $(".image-gallery div img:nth-of-type(#{currentImgNumber})")
    nextImg = $(".image-gallery div img:nth-of-type(#{nextImgNumber})")
    previousImg = $(".image-gallery div img:nth-of-type(#{previousImgNumber})")
    randomImg = $(".image-gallery div img:nth-of-type(#{randomImgNumber})")

  callFunctions = ->
    boldText()
    imgLoop()
    refreshImgs()

  restartInterval = ->
    clearInterval interval
    interval = setInterval(loopImages, 5000)

  loopImages = ->
    $(".next-banner").trigger "click"
  
  $(".image-gallery-links a").click ->
    restartInterval()
    randomImgNumber = parseInt($(this).attr("href"))
    randomImg = $(".image-gallery div img:nth-of-type(#{randomImgNumber})")
    randomImgFade()
    currentImgNumber = randomImgNumber
    callFunctions()
    false
    
  $("#previous").click ->
    restartInterval()
    previousImgFade()
    currentImgNumber = previousImgNumber
    callFunctions()
    
  $("#next, .next-banner").click ->
    restartInterval()
    nextImgFade()
    currentImgNumber = nextImgNumber
    callFunctions()
  
  init()
  
  $(window).on "resize load", ->
    $("#previous").height $(".slider").height()
    $("#next").height $(".slider").height()
    
  $(".banner-image-gallery-links").width parseInt(numberofImgs) * 34
