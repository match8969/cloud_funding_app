require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module CloudFundingApp
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.1

    config.generators do |g| 
      g.test_framework :rspec,
        # the creation of the file that create test database records.
        fixtures: false,
        # the view spec
        view_specs: false,
        # spec for helper files
        helper_spect: false,
        # 
        routing_specs: false
    end
  end
end
