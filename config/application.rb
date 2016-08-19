require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Landing
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.
    # Do not include default locale in generated URLs
    RoutingFilter::Locale.include_default_locale = false

    config.i18n.available_locales = %w(en pt-PT)
    config.i18n.default_locale='en'
  end
end
