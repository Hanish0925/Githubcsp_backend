require_relative "boot"

require "rails/all"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module OvalApi
  class Application < Rails::Application
    # Initialize configuration defaults for the originally generated Rails version.
    config.load_defaults 7.2

    # Configure rack-cors for Cross-Origin Resource Sharing (CORS)
    config.middleware.insert_before 0, Rack::Cors do
      allow do
        origins '*' # Replace '*' with specific domains for security, e.g., 'https://example.com'.
        resource '*',
                 headers: :any,
                 methods: [:get, :post, :put, :patch, :delete, :options, :head]
      end
    end

    # Add eager load and autoload paths, while ignoring specific directories.
    config.autoload_paths += Dir[Rails.root.join('lib', '**/')] # Add all subdirectories of lib.
    config.autoload_lib(ignore: %w[assets tasks]) # Ignore specific subdirectories.

    # Configuration for the application, engines, and railties goes here.
    #
    # These settings can be overridden in specific environments using the files
    # in config/environments, which are processed later.

    # Uncomment and set your time zone if needed.
    # config.time_zone = "Central Time (US & Canada)"

    # Add additional paths for eager loading.
    # config.eager_load_paths << Rails.root.join("extras")
  end
end

