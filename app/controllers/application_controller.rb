class ApplicationController < ActionController::Base
  before_action :set_locale
  protect_from_forgery with: :exception

  def index
    @users = User.where.not(:image_url => nil).shuffle.take(100)
    #flash[:notice] = t(:hello_flash)
  end

  def default_url_options
    { locale: I18n.locale }
  end

  private

  def set_locale
    #I18n.locale =request.env['HTTP_ACCEPT_LANGUAGE'].scan(/^[a-z]{2}/).first
    I18n.locale = params[:locale] ||
        http_accept_language.compatible_language_from(I18n.available_locales) ||
        I18n.default_locale

  end

  def get_locale(locale)
    if I18n.available_locales.include? locale
      locale
    else
      I18n.default_locale
    end
  end
end
