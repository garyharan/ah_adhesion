class ReservertWidget
  constructor: ->
    @initializeContainer()
    @initializeCSS()
    @initializeTitle()

    @toggle()

  initializeContainer: =>
    @container = container = document.createElement "div"
    @container.id = "reservert_container"
    @container.className = "inactive"
    @container.innerHTML = '<%= render partial: "widget", locals: { dossier: @dossier }  %>'
    document.body.appendChild @container

  initializeTitle: =>
    @title = document.getElementById('reservert_title')
    @title.addEventListener "click", (e) =>
      @toggle(e)

  initializeCSS: =>
    for href in [
      "http://fonts.googleapis.com/css?family=Open+Sans:400,700|Oswald:400,300",
      "<%= URI.join(root_url, path_to_stylesheet('widget.css')).to_s %>"
    ]
      do (href) ->
        link = document.createElement "link"
        link.href = href
        link.rel  = "stylesheet"
        link.type ="text/css"
        document.head.appendChild link

  toggle: (e) =>
    @container.className = if @container.className == "inactive" then "active" else "inactive"

window.reservert_widget = new ReservertWidget

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
