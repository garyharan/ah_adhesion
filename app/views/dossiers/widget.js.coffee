class ReservertWidget
  constructor: ->
    @initializeContainer()
    @initializeCSS()
    @initializeTitle()
    @initializeContent()

    @toggle() # to be removed later

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

  initializeContent: =>
    @content = document.getElementById('reservert_content')
    @content.addEventListener "click", (e) =>
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
