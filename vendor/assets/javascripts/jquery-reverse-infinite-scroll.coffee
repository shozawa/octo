do ($ = jQuery) ->
  check = ->
    distance = @scrollTop()
    if distance == 0
      scrollHeight = @[0].scrollHeight
      nextLink = @find("[rel=next]")
      if nextLink.size() isnt 0
        $.getScript(nextLink.attr("href")).done =>
          diff = @[0].scrollHeight - scrollHeight
          @scrollTop(diff)

  methods = {
    init: ->
      @scrollTop(@[0].scrollHeight - @height())
      scrollHandler = (=>check.apply(@))
      scrollTimeout = null
      # デバッグ用
      console.log("初期化されました")

      @scroll ->
        if scrollTimeout
          clearTimeout(scrollTimeout)
          scrollTimeout = null
        scrollTimeout = setTimeout(scrollHandler, 1500)
  }

  $.fn.reverseInfiniteScroll = (method) ->
    @each ->
      if methods[method]
        methods[method].apply($(@), Array.prototype.slice(arguments, 1))
      else if (typeof method == 'object' || ! method)
        methods.init.apply($(@), arguments)
      else
        $.error("an error has occured.")
