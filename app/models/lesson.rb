class Lesson < ActiveRecord::Base
  belongs_to :section
  dragonfly_accessor :file
  
  scope :published, -> { where(visibility: 'public').order('updated_at DESC') }

  def published
    visibility == 'public'
  end
end
