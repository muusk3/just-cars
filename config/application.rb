require_relative "boot"

require "rails"
require "active_model/railtie"
require "active_job/railtie"
require "active_record/railtie"
require "active_storage/engine"
require "action_controller/railtie"
require "action_mailer/railtie"
require "action_mailbox/engine"
require "action_text/engine"
require "action_view/railtie"
require "action_cable/engine"
# require "sprockets/railtie"
require "rails/test_unit/railtie"

Bundler.require(*Rails.groups)

module JustCars
  class Application < Rails::Application
    config.load_defaults 6.1

    config.active_job.queue_adapter = :inline
    config.api_only = true

    config.active_record.time_zone_aware_types = %i[datetime time]
    config.i18n.available_locales = ['en']
    config.time_zone = "Warsaw"
  end
end
