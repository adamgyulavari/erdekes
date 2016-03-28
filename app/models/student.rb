class Student < ActiveRecord::Base
  include SocialAuthenticatable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_one :profile, as: :user
  has_many :solutions
  
  def name
    profile.nick_name || "#{profile.first_name} #{profile.last_name}".presence
  end

  def full_name
    "#{profile.first_name} #{profile.last_name}"
  end
end
