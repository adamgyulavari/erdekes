class Solution < ActiveRecord::Base
  belongs_to :mission
  belongs_to :student

  dragonfly_accessor :source

  scope :published, -> { where(visibility: 'public') }
  scope :without_examples, -> { where.not(student_id: nil) }
  scope :without_result, -> { where(result: 0) }

  validates :source, presence: true
  validates_size_of :source, maximum: 10.megabytes,
      message: "10 megánál ne legyen má több...", if: :source_changed?

  def published
    visibility == 'public'
  end

  def self.without_result_ids
    Solution.without_examples.without_result.ids
  end
end
