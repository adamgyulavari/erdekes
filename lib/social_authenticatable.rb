module SocialAuthenticatable
  extend ActiveSupport::Concern

  ## Definitions
  included do
    has_many :authentications, as: :authenticatable, dependent: :destroy
  end

  ## Class methods
  module ClassMethods

    def find_or_create_with(provider, auth, params = {})
      raise 'Provider not implemented' unless OmniAuth::Builder.providers.include? provider.to_sym

      # find by uid
      resource = self.joins(:authentications)
                     .where(authentications: { provider: provider, uid: auth.uid })
                     .readonly(false)
                     .first

      # find by email if no match for uid
      unless resource
        resource = self.find_by_email(auth.info.try(:email))
      end

      return nil if self == Teacher && resource.nil?

      # create record if not existing
      unless resource
        resource = self.create! email:      auth.info.try(:email) || "#{SecureRandom.hex}@not-a-vaild-address.com",
                                password:   Devise.friendly_token[0,20]
        resource.build_profile(first_name: auth.info.try(:first_name),
                               last_name: auth.info.try(:last_name),
                               image_url: auth.info.try(:image))
        resource.save
      end

      # create authentication if needed
      unless resource.authentications.find_by_provider(provider)
        resource.authentications << Authentication.create!(uid:      auth.uid,
                                                           provider: provider)
      end

      # refresh token for authentication
      resource.authentications
              .find_by_provider(provider)
              .update_attributes!(access_token: auth.credentials.token)

      return resource
    end

  end

  ## Instance methods


  ## Module methods
  def self.included(mod)
    @classes ||= []
    @classes << mod
  end

  def self.classes
    @classes
  end

end
