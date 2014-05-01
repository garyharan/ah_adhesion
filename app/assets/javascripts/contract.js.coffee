# Handles the contract page form.
# Only allows submission once you accept modalities
$ ->
  class FormManager
    constructor: (@form) ->
      @allowSubmission()
      @setupClickHandler()

    allBoxesAreTicked: =>
      $(@form).find("input:checkbox:not(:checked)").length == 0

    checkboxClickHandler: (event) =>
      @allowSubmission()

    allowSubmission: =>
      $(@form).find("input[type=submit]").prop("disabled", !@allBoxesAreTicked())

    setupClickHandler: ->
      $(@form).find("input:checkbox").click @checkboxClickHandler

  $("form[data-must-check-all=true]").each (index) ->
    new FormManager(this)
