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

# Facebook hack for turbolinks: thanks Pierre-Olivier Martel http://reed.github.io/turbolinks-compatibility/facebook.html
fb_root = null
fb_events_bound = false

bindFacebookEvents = ->
  $(document)
    .on('page:fetch', saveFacebookRoot)
    .on('page:change', restoreFacebookRoot)
    .on('page:load', ->
      FB?.XFBML.parse()
    )
  fb_events_bound = true

saveFacebookRoot = ->
  fb_root = $('#fb-root').detach()

restoreFacebookRoot = ->
  if $('#fb-root').length > 0
    $('#fb-root').replaceWith fb_root
  else
    $('body').append fb_root

loadFacebookSDK = ->
  window.fbAsyncInit = initializeFacebookSDK
  $.getScript("//connect.facebook.net/en_US/all.js#xfbml=1")

initializeFacebookSDK = ->
  FB.init
    appId     : 'YOUR_APP_ID'
    channelUrl: '//WWW.YOUR_DOMAIN.COM/channel.html'
    status    : true
    cookie    : true
    xfbml     : true

$ ->
  loadFacebookSDK()
  bindFacebookEvents() unless fb_events_bound
