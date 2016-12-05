require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Microblog
  class Application < Rails::Application
    config.encoding = 'utf-8'
    config.time_zone = 'America/Fortaleza'
    config.i18n.default_locale = :'en'
    # config.i18n.available_locales = %w(pt-BR en)
    # config.active_record.raise_in_transactional_callbacks = true
    config.assets.paths << Rails.root.join('app', 'assets', 'fonts')

    config.assets.precompile += %w( .svg .otf .eot .woff .ttf)
  end
end
