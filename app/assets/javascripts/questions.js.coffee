$(document).on "page:change", ->
  $(".help .help-toggle").click (e) ->
    parent = $(this).parents(".help")
    parent.find(".help-toggle").toggle()
    parent.find(".help-content").toggle()
    return false

  $("label").on "click", (e) ->
    label = $(e.target).closest('label')
    form = $(this).get(0).form

    $(label).find("input[type=radio]").get(0).checked = true
    $(form).trigger('submit.rails')

    if $(e.target).prop('tagName') != 'INPUT'
      return false
