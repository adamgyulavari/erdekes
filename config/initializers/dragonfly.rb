require 'dragonfly'

# Configure
Dragonfly.app.configure do
  plugin :imagemagick

  secret "169262fb4b9763a9148824f41ab9eedd663bc0798dfa7b34c3e7d779273589a2"

  url_format "/media/:job/:name"

  # unless Rails.env.production?
  #   datastore :file,
  #     root_path: Rails.root.join('public/system/dragonfly', Rails.env),
  #     server_root: Rails.root.join('public')
  # else
    datastore S3DataStore.new(
      bucket_name: 'erdekes-heroku',
      access_key_id: ENV['amazon_access_key'],
      secret_access_key: ENV['amazon_secret_key'],
      region: 'eu-west-1')
  # end
end

# Logger
Dragonfly.logger = Rails.logger

# Mount as middleware
Rails.application.middleware.use Dragonfly::Middleware

# Add model functionality
if defined?(ActiveRecord::Base)
  ActiveRecord::Base.extend Dragonfly::Model
  ActiveRecord::Base.extend Dragonfly::Model::Validations
end
