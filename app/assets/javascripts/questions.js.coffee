$ ->
  $("td.help a.toggle_help").click (e) ->
    parent = $(this).closest("td.help")
    parent.find("a.help_on").toggle()
    parent.find("a.help_off").toggle()
    parent.find("div.toggle_help").toggle()
    return false
