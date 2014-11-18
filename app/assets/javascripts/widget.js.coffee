$ ->
  class WidgetPage
    constructor: ->
      @header  = $("#reservert_header")
      @actions = $("#concrete_actions")
      @content = $("#reservert_content")
      @footer  = $("#reservert_footer")
      @help    = $("#help_section")

      @initializeHelp()
      @initializeVoting()

    initializeHelp: =>
      $("#toggle_help").on "click", (e) =>
        @toggleHelp()
        e.preventDefault()

      $(@help).on "click", (e) =>
        @toggleHelp()
        e.preventDefault()

    initializeVoting: =>
      $("article form.button_to[data-remote]").on "ajax:success", (e, data, status, xhr) ->
        newCount = data.replace(/\D/g, "")
        $(e.target).find("span.count").html(newCount)

    toggleHelp: =>
      $(@header).toggle()
      $(@actions).toggle()
      $(@content).toggle()
      $(@help).toggle()
      $(@footer).toggle()



  window.WidgetPage = new WidgetPage()


