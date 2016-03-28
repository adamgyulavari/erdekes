class Course < ActiveRecord::Base
  has_many :sections
  
  scope :published, -> { where(visibility: 'public') }

  def published
    visibility == 'public'
  end

  def new_solutions
    sections.includes(missions: :solutions).merge(Solution.without_result.without_examples).count
  end
end
