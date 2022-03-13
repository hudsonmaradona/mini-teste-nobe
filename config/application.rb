require_relative 'boot'

require 'rails/all'

# Pick the frameworks you want:
require "active_model/railtie"
require "active_job/railtie"
require "active_record/railtie"
require "active_storage/engine"
require "action_controller/railtie"
require "action_mailer/railtie"
require "action_view/railtie"
require "action_cable/engine"
require "sprockets/railtie"
# require "rails/test_unit/railtie"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module MiniTesteNobe
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.2

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration can go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded after loading
    # the framework and any gems in your application.

    config.time_zone = 'Brasilia'

    # Alter directory locale is app/ loaded.
    config.i18n.enforce_available_locales = true
    config.i18n.locale = :'pt-BR'
    config.i18n.load_path += Dir[Rails.root.join("app/locales/**/*.{rb,yml}").to_s]
    config.i18n.default_locale = 'pt-BR'
    config.i18n.fallbacks = [:'pt-BR']

    config.autoload_paths += Dir["#{config.root}/lib/**/"]
    config.generators.system_tests = nil

  end
end
