class Section < ActiveRecord::Base
  belongs_to :course
  has_many :lessons
  has_many :missions

  scope :published, -> { where(visibility: 'public').order('updated_at DESC') }

  def published
    visibility == 'public'
  end

  def new_solutions
    missions.includes(:solutions).merge(Solution.without_result.without_examples).count
  end
end
