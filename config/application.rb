require_relative "boot"

require "rails/all"

Bundler.require(*Rails.groups)

module Furima39514
  class Application < Rails::Application
    config.load_defaults 7.0
    config.i18n.default_locale = :ja
    config.time_zone = 'Tokyo'
    config.active_storage.variant_processor = :mini_magick
  end
end
