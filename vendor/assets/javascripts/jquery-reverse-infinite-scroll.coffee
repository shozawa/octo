do ($ = jQuery) ->
  check = ->
    distance = @scrollTop()
    nextLink = @find("[rel=next]");
    console.log("check" + nextLink.attr("href"))

    if distance == 0
      scrollHeight = @[0].scrollHeight
      if nextLink.size() isnt 0
        $.getScript(nextLink.attr("href")).done =>
          diff = @[0].scrollHeight - scrollHeight
          @scrollTop(diff)

  methods = {
    init: ->
      console.log("初期化")
      @scrollTop(@[0].scrollHeight - @height())
      scrollHandler = (=>check.apply(@))
      scrollTimeout = null

      @on 'scroll.reverse-infinite-scroll', ->
        if scrollTimeout
          clearTimeout(scrollTimeout)
          scrollTimeout = null
        scrollTimeout = setTimeout(scrollHandler, 1500)

    off: ->
      console.log("リセット")
      @off '.reverse-infinite-scroll'
  }

  $.fn.reverseInfiniteScroll = (method) ->
    @each ->
      if methods[method]
        methods[method].apply($(@), Array.prototype.slice(arguments, 1))
      else if (typeof method == 'object' || ! method)
        methods.init.apply($(@), arguments)
      else
        $.error("an error has occured.")
