class Authentication < ActiveRecord::Base
  ## Associations
  belongs_to :authenticatable, polymorphic: true

  ## Validations
  validates :uid,             presence: true, uniqueness: { scope: [:provider, :authenticatable_type] }
  validates :provider,        presence: true, uniqueness: { scope: [:authenticatable_type, :authenticatable_id] }
end
