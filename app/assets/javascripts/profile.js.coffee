$ ->
  $("#profile_form").submit (e) ->
    any_were_hit = false
    $("#profile_manager_email, #profile_manager_phone, #profile_manager_name, #profile_member_since, #profile_name").each (index) ->
      if $(@).val() == ""
        $(@).closest(".form-group").addClass("has-error")
        $(@).focus()
        any_were_hit = true
        e.preventDefault()

    if any_were_hit
      alert "Veuillez remplir tout les champs avec une bordure rouge"
