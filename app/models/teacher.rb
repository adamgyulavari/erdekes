class Teacher < ActiveRecord::Base
  include SocialAuthenticatable
  devise :database_authenticatable, :rememberable, :trackable

  has_one :profile, as: :user
  
  def name
    profile.nick_name || "#{profile.first_name} #{profile.last_name}".presence
  end
end
