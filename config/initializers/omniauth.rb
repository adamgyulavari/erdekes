require "omniauth-google-oauth2"

## patch OmniAuth
module OmniAuth
  class Builder < ::Rack::Builder
    def provider_patch(klass, *args, &block)
      @@providers ||= []
      @@providers << klass
      old_provider(klass, *args, &block)
    end
    alias old_provider provider
    alias provider provider_patch
    class << self
      def providers
        @@providers
      end
    end
  end
end

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :google_oauth2, ENV['google_app_id'], ENV['google_app_secret'], skip_jwt: true

  on_failure { |env| raise 'e' }
end
