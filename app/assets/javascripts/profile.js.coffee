$ ->
  class ProfileManager
    constructor: ->
      @form          = $("#profile_form")
      @copy_checkbox = $("#copy_manager_fields")

      return if @form.length == 0

      @setInitialStateOfCopyCheckbox()

      @copy_checkbox.on "change", (e) =>
        @checkBoxChangedHandler()

      @copyWhenChangingValue()

      @form.submit (e) =>
        @formSubmissionHandler


    checkBoxChangedHandler: =>
      if @shouldCopyDataOver()
        @fakeDisableDirectorGroup()
        @copyDataOver()
      else
        @fakeEnableDirectorGroup()
        @stopCopyingData()

    formSubmissionHandler: =>
      any_were_hit = false
      $("#profile_manager_email, #profile_manager_phone, #profile_manager_name, #profile_member_since, #profile_name").each (index) ->
        if $(@).val() == ""
          $(@).closest(".form-group").addClass("has-error")
          $(@).focus()
          any_were_hit = true
          e.preventDefault()
      if any_were_hit
        alert "Veuillez remplir tout les champs avec une bordure rouge"

    copyDataOver: =>
      $("#profile_director_name").val($("#profile_manager_name").val())
      $("#profile_director_title").val($("#profile_manager_title").val())
      $("#profile_director_phone").val($("#profile_manager_phone").val())
      $("#profile_director_email").val($("#profile_manager_email").val())

    setInitialStateOfCopyCheckbox: =>
      $(@copy_checkbox).prop("checked", @dataIsTheSame())
      @checkBoxChangedHandler()

    dataIsTheSame: =>
      $("#profile_director_name").val() == $("#profile_manager_name").val() &&
        $("#profile_director_title").val() == $("#profile_manager_title").val() &&
        $("#profile_director_phone").val() == $("#profile_manager_phone").val() &&
        $("#profile_director_email").val() == $("#profile_manager_email").val()

    copyWhenChangingValue: =>
      $("#profile_manager_name, #profile_manager_title, #profile_manager_phone, #profile_manager_email").on "keyup", (e) =>
        if @shouldCopyDataOver()
          @copyDataOver()

    shouldCopyDataOver: =>
      $(@copy_checkbox).prop("checked") == true

    fakeDisableDirectorGroup: =>
      $("#director_group input").css({background: "#ddd"})

    fakeEnableDirectorGroup: =>
      $("#director_group input").css({background: ""})

  new ProfileManager()
