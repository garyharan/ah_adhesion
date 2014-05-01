$(document).on "page:change", ->
  $(".help .help-toggle").click (e) ->
    parent = $(this).parents(".help")
    parent.find(".help-toggle").toggle()
    parent.find(".help-content").toggle()
    return false

  # make sure already loaded forms work fine
  $(".s3-uploader").S3Uploader()
  $(".s3-uploader").bind "ajax:success", (e, data) ->
    $(this).closest("tr.question").find("ul.addition").append(data)

  # this is the part where we handle clicking Yes or No in Questionnaire
  $("label").on "click", (e) ->
    label = $(e.target).closest('label')
    form = $(this).get(0).form

    $(label).find("input[type=radio]").get(0).checked = true
    proof_files = $(this).closest("tr.question").find("div.proof_files")
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
    if $(this).closest(".question").find(".proof_files form.s3-uploader").length == 0
      $(this).closest("tr").find(".proof_files").append(data)
      upload_form = $(this).closest("tr").find(".proof_files form:last")
      upload_form.S3Uploader()

      upload_form.bind "ajax:success", (e, data) ->
        $(this).closest(".question").find("ul.addition").append(data)
