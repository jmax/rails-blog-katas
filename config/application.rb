require File.expand_path('../boot', __FILE__)

require "active_model/railtie"
require "active_record/railtie"
require "action_controller/railtie"
require "action_mailer/railtie"
require "action_view/railtie"
require "sprockets/railtie"

Bundler.require(*Rails.groups)

module Blog
  class Application < Rails::Application
    config.generators do |g|
      g.assets           = false
      g.helper           = false
      g.view_specs       = false
      g.helper_specs     = false
      g.controller_specs = false
    end
  end
end
