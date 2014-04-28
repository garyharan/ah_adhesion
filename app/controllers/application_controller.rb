class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  # https://github.com/plataformatec/devise/wiki/How-To:-Redirect-to-a-specific-page-on-successful-sign-in
  def after_sign_in_path_for(resource)
    sign_in_url = url_for(:action => 'new', :controller => 'devise/sessions', :only_path => false, :protocol => 'http')

    if request.referer == sign_in_url
      super
    else
      stored_location_for(resource) || certifications_path
    end
  end
end
