module ApplicationHelper
  def link_to_switch_language
    if I18n.locale == :en
      lang = :fr
      text = 'Français'
    else
      lang = :en
      text = 'English'
    end

    link_to text, request.original_url, onclick: raw("document.cookie='chosen_language=#{lang}; expires=Mon, 31 Mar 2042 20:20:32 GMT; path=/;'")
  end
end
