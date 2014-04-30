$(document).on "page:change", ->
  $(".help .help-toggle").click (e) ->
    parent = $(this).parents(".help")
    parent.find(".help-toggle").toggle()
    parent.find(".help-content").toggle()
    return false

  # this is the part where we handle clicking Yes or No in Questionnaire
  $("label").on "click", (e) ->
    label = $(e.target).closest('label')
    form = $(this).get(0).form

    $(label).find("input[type=radio]").get(0).checked = true
    $(form).trigger('submit.rails')

    if $(e.target).prop('tagName') != 'INPUT'
      return false

  # This is the part that injects upload form if it is not there yet.
  $(".answer_form").bind "ajax:success", (xhr, data, status) ->
    $(this).closest("table").find("tr.proof_files td:last").append(data)
    upload_form = $(this).closest("table").find("tr.proof_files td:last form:last")
    upload_form.S3Uploader()

    upload_form.bind "ajax:success", (e, data) ->
      $(this).closest("table.question").find("ul.addition").append(data)
