class ApplicationController < ActionController::Base
  before_action 'set_locale'
  protect_from_forgery with: :exception


  def index
    flash[:notice] = t(:hello_flash)
  end

  private
  def set_locale
    I18n.locale = http_accept_language.compatible_language_from(I18n.available_locales)
  end

end
