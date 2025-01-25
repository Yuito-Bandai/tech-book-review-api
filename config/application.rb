require_relative "boot"

require "rails/all"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module TechBookReview
  class Application < Rails::Application
    config.eager_load_paths << Rails.root.join('app','services')
    config.load_defaults 7.0
    config.api_only = true
  end
end
