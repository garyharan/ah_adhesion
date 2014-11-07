$ ->
  class WidgetPage
    constructor: ->
      @initializeVoting()

    initializeVoting: =>
      $("a[data-remote].vote").on "ajax:success", (e, data, status, xhr) ->
        newCount = data.replace(/\D/g, "")
        $(e.target).find("span.count").html(newCount)

  window.WidgetPage = new WidgetPage()
