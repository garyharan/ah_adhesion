$(document).on "page:change", ->

  class Question
    constructor: (@question) ->
      @help    = $(@question).find(".help .help-toggle")
      @label   = $(@question).find("label")
      @form    = $(@question).find(".answer_form")
      @spinner = $(@question).find(".spinner")

      @setupAnswerHandler()
      @setupHelpToggleHandler()
      @awsUploaderHandler()

      @form.bind "ajax:send", (e) =>
        @spinner.show()
      @form.bind "ajax:success", (e) =>
        @spinner.hide()


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

    awsUploaderHandler: =>
      s3_uploader_form = $(@question).find(".proof_files form.s3-uploader")
      s3_uploader_form.S3Uploader()

      s3_uploader_form.bind "ajax:beforeSend", (e) =>
        @spinner.show()

      s3_uploader_form.bind "ajax:success", (e, data) =>
        $(@question).find("ul.addition").append(data)
        @spinner.hide()

  $("tr.question:first-child").each (index) ->
    new Question(this)


  class Attachment
    constructor: (@attachment) ->

