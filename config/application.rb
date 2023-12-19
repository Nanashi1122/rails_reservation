require_relative "boot"

require "rails/all"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Reservationapp
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 6.1
    config.i18n.default_locale = :ja
  
    config.time_zone = 'Tokyo'
  end
end

module HomestayMatching
  class Application < Rails::Application
    config.active_storage.variant_processor = :mini_magick
  end
end