class Profile < ActiveRecord::Base
  
  dragonfly_accessor :avatar

  belongs_to :user, polymorphic: true

  def image
    if avatar_stored?
      avatar.thumb("50x50#").url
    else
      image_url
    end
  end

end
