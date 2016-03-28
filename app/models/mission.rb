class Mission < ActiveRecord::Base
  belongs_to :section
  has_many :solutions

  dragonfly_accessor :objectives

  scope :published, -> { where(visibility: 'public').order('updated_at DESC') }

  scope :before_deadline, -> { where('deadline > ?', Time.now).where('deadline < ?', 2.weeks.from_now) }
  scope :near_deadline,   -> { where('deadline < ?', 1.week.from_now) }

  def published
    visibility == 'public'
  end

  def example_solution
    solutions.where(student_id: nil).first
  end

  def solution_for(student)
    solutions.where(student_id: student.id).first
  end

  def doable?
    deadline.nil? || deadline > Time.now
  end

  def near_deadline?
    deadline < 1.week.from_now
  end

  def new_solutions
    solutions.without_result.without_examples.count
  end
end
