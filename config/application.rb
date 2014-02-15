require File.expand_path('../boot', __FILE__)

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(:default, Rails.env)

module TodoGoogleDrive
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    # Set Time.zone default to the specified zone and make Active Record auto-convert to this zone.
    # Run "rake -D time" for a list of tasks for finding time zone names. Default is UTC.
    # config.time_zone = 'Central Time (US & Canada)'

    # The default locale is :en and all translations from config/locales/*.rb,yml are auto loaded.
    # config.i18n.load_path += Dir[Rails.root.join('my', 'locales', '*.{rb,yml}').to_s]
    # config.i18n.default_locale = :de

    # In order to silence the warning edit the application.rb file and include the following line inside the Rails::Application body
    # config.i18n.enforce_available_locales = true
    # The possible values are:

    # false: if you
    # want to skip the locale validation
    # don't care about locales
    # true: if you
    # want the application to raise an error if an invalid locale is passed (or)
    # want to default to the new Rails behaviors (or)
    # care about locale validation
    # Note:
    # The old default behavior corresponds to false, not true.
    # If you are setting the config.i18n.default_locale configuration or other i18n settings, make sure to do it after setting the config.i18n.enforce_available_locales setting.
    # If your use third party gems that include I18n features, setting the variable through may not have effect. In this case, set it directly to I18n using I18n.config.enforce_available_locales.
    config.i18n.enforce_available_locales = true



  end
end
