$(document).on "page:change", ->
  class Question
    constructor: (@question) ->
      @help             = $(@question).find(".help .help-toggle")
      @label            = $(@question).find("label")
      @form             = $(@question).find(".answer_form")
      @spinner          = $(@question).find(".spinner")
      @delete_file_link = $(@question).find(".delete_attachment")

      @setupAnswerHandler()
      @setupHelpToggleHandler()
      @awsUploaderHandler()
      @setupDeleteAttachmentHandler()
      @setupAttachmentWasUploadedHandler()

      @form.bind "ajax:send", (e) =>
        @spinner.show()
      @form.bind "ajax:success", (e) =>
        @spinner.hide()

    setupDeleteAttachmentHandler: =>
      @delete_file_link.on "ajax:success", (e) =>
        $(e.target).closest("li").remove()

    setupAttachmentWasUploadedHandler: =>
      $(document).on "page:before-change", (e) =>
        if $(@question).find(".answer_form input:radio:checked").val() == "true" && $(@question).find("ul.addition li").length == 0
          $(@question).addClass("need_answer")
          alert("Une de vos réponses requiert une pièce justificatives.  Veuillez la rajouter avant de continuer.")
          event.preventDefault()

    setupHelpToggleHandler: =>
      @help.click (e) =>
        parent = $(@help).closest(".help")
        parent.find(".help-toggle").toggle()
        parent.find(".help-content").toggle()
        return false

    # labels contain the checkboxes and therefore get the click
    setupAnswerHandler: =>
      @label.on "click", (e) =>
        label       = $(e.target).closest("label")
        proof_files = $(@question).find("div.proof_files")
        value       = label.find("input[type=radio]").val()
        form        = $(label).get(0).form

        return if $(form).hasClass("edit_answer") # admin section

        # ensuring selection if label is clicked instead of input
        label.find("input[type=radio]").prop("checked", true)

        if value == "true"
          proof_files.show()
        else
          proof_files.hide()

        # submit form as you would but don't do it twice because of bubbling
        $(form).trigger('submit.rails')

    awsUploaderHandler: =>
      s3_uploader_form = $(@question).find(".proof_files form.s3-uploader")
      s3_uploader_form.S3Uploader()

      s3_uploader_form.bind 's3_uploads_start', (e) =>
        $(@question).find("form.s3-uploader").hide()
        $(@question).find(".file_spinner").show()

      s3_uploader_form.bind "ajax:success", (e, data) =>
        $(@question).find("ul.addition").append(data)
        $(@question).removeClass("need_answer")

        @delete_attachment.unbind("ajax:success")
        @delete_attachment.on "ajax:success", (e) =>
          $(e.target).closest("li").remove()

        $(@question).find(".file_spinner").hide()
        $(@question).find("form.s3-uploader").show()

  $("tr.question").each (index) ->
    new Question(this)

  class AdminQuestion
    constructor: (form) ->
      @form = form

      $(@form).find("textarea").on "keyup", (e) =>
        @saveForm()
      $(@form).find("input:checkbox").on "change", (e) =>
        @saveForm()

    saveForm: =>
      $(@form).trigger("submit.rails")

  $("form.edit_answer").each (index) ->
    new AdminQuestion(this)
