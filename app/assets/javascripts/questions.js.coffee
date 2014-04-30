$(document).on "page:change", ->
  $("td.help a.toggle_help").click (e) ->
    parent = $(this).closest("td.help")
    parent.find("a.help_on").toggle()
    parent.find("a.help_off").toggle()
    parent.find("div.toggle_help").toggle()
    return false

  $("label").on "click", (e) ->
    label = $(e.target).closest('label')
    form = $(this).get(0).form

    $(label).find("input[type=radio]").get(0).checked = true
    $(form).trigger('submit.rails')

    if $(e.target).prop('tagName') != 'INPUT'
      return false


  $(".answer_form").bind "ajax:success", (xhr, data, status) ->
    $(this).closest("table").find("tr.proof_files td:last").append(data)
    $(this).closest("table").find("tr.proof_files td:last form:last").S3Uploader()
