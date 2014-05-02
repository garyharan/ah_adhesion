$(document).on "page:change", ->

  class Question
    constructor: (@question) ->
      @help  = $(@question).find(".help .help-toggle")
      @label = $(@question).find("label")
      @form  = $(@question).find(".answer_form")

      @setupAnswerHandler()
      @setupHelpToggleHandler()
      @setupAjaxUploaderFormInjection()

      # some forms are preloaded
      existing_s3_form = $(@question).find(".s3-uploader")
      existing_s3_form.S3Uploader()
      existing_s3_form.bind "ajax:success", (e, data) =>
        $(@question).find("ul.addition").append(data)

    setupHelpToggleHandler: =>
      @help.click (e) =>
        parent = $(@help).parents(".help")
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

        # ensuring selection if label is clicked instead of input
        label.find("input[type=radio]").prop("checked", true)

        if value == "true"
          proof_files.show()
        else
          proof_files.hide()

        # submit form as you would but don't do it twice because of bubbling
        $(form).trigger('submit.rails')
        e.stopPropagation()
        return false

    setupAjaxUploaderFormInjection: =>
      $(@form).bind "ajax:success", (xhr, data, status) ->
        if $(@question).find(".s3-uploader").length == 0
          $(this).closest("tr").find(".proof_files").append(data)
          upload_form = $(this).closest("tr").find(".proof_files form:last")
          upload_form.S3Uploader()

          upload_form.bind "ajax:success", (e, data) ->
            $(this).closest(".question").find("ul.addition").append(data)




  $("tr.question").each (index) ->
    new Question(this)
