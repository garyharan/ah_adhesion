class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :set_locale

  # https://github.com/plataformatec/devise/wiki/How-To:-Redirect-to-a-specific-page-on-successful-sign-in
  def after_sign_in_path_for(resource)
    certifications_path
  end

  def set_active_certification
    return nil unless user_signed_in?
    @active_certification = current_user.certifications.where(state: :draft).first
  end

  def set_locale
    I18n.locale = extract_locale_from_accept_language_header || I18n.default_locale
  end

  private

  def extract_locale_from_accept_language_header
    accept = request.env['HTTP_ACCEPT_LANGUAGE']
    return nil if accept.nil?
    accept.scan(/^[a-z]{2}/).first
  end
end
