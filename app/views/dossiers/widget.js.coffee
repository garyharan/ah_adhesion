
container = document.createElement "div"
container.id = "reservert_container"

container.innerHTML = '<%= render partial: 'widget', locals: { dossier: @dossier }  %>'
document.body.appendChild container

css = document.createElement "link"
css.rel = "stylesheet"
css.type = "text/css"
css.href = "<%= URI.join(root_url, path_to_stylesheet('widget.css')).to_s %>"
document.head.appendChild css
