$ ->
  $("time").timeago()

  class AutoSaver
    constructor: (form) ->
      @form = form
      $(@form).find("textarea").on "keyup", (e) =>
        @saveForm()

    saveForm: =>
      $(@form).trigger("submit.rails")

  $("form.edit_certification").each (index) ->
    new AutoSaver(this)

