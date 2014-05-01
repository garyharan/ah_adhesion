$(document).on "page:change", ->
  $("td.help a.toggle_help").click (e) ->
    parent = $(this).closest("td.help")
    parent.find("a.help_on").toggle()
    parent.find("a.help_off").toggle()
    parent.find("div.toggle_help").toggle()
    return false

  # this is the part where we handle clicking Yes or No in Questionnaire
  $("label").on "click", (e) ->
    label = $(e.target).closest('label')
    form = $(this).get(0).form

    $(label).find("input[type=radio]").get(0).checked = true
    proof_files = $(this).closest("table.question").find("tr.proof_files")
    answer = $(label).find("input[type=radio]").val()
    if answer == "true"
      proof_files.show()
    else
      proof_files.hide()
    $(form).trigger('submit.rails')

    if $(e.target).prop('tagName') != 'INPUT'
      return false

  # This is the part that injects upload form if it is not there yet.
  $(".answer_form").bind "ajax:success", (xhr, data, status) ->
    if $(this).closest("table.question").find("tr.proof_files form").length == 0
      $(this).closest("table").find("tr.proof_files td:last").append(data)
      upload_form = $(this).closest("table").find("tr.proof_files td:last form:last")
      upload_form.S3Uploader()

      upload_form.bind "ajax:success", (e, data) ->
        $(this).closest("table.question").find("ul.addition").append(data)
