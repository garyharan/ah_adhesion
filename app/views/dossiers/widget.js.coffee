class ReservertWidget
  constructor: ->
    @initializeContainer()
    @initializeCSS()
    @initializeTitle()

  initializeContainer: =>
    @container = container = document.createElement "div"
    @container.id = "reservert_container"
    @container.className = "initial"
    @container.innerHTML = '<%= render partial: "widget", locals: { dossier: @dossier }  %>'
    document.body.appendChild @container

  initializeTitle: =>
    @title = document.getElementById('reservert_title')
    @title.addEventListener "click", (e) =>
      @toggle(e)

  initializeCSS: =>
    for href in [
      "https://fonts.googleapis.com/css?family=Open+Sans:400,700|Oswald:400,300",
      "<%= URI.join(root_url, path_to_stylesheet('widget.css')).to_s %>"
    ]
      do (href) ->
        link = document.createElement "link"
        link.href = href
        link.rel  = "stylesheet"
        link.type ="text/css"
        document.head.appendChild link

  toggle: (e) =>
    @container.className = if @container.className != "active" then "active" else "inactive"

window.reservert_widget = new ReservertWidget
