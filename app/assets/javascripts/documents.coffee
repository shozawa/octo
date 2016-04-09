$ ->
  $('.js-toggle-search-option').click ->
    $('.search-option').toggle()

  #高さ調整
  height_adjust = ->
      body_height = $('body').height()
      height = body_height - 300
      $('.infinite-posts').height(height)
  height_adjust()

  #リサイズ時
  $(window).resize ->
    height_adjust()
