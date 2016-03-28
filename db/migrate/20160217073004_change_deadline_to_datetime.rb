class ChangeDeadlineToDatetime < ActiveRecord::Migration
  def change
    change_column :missions, :deadline, :datetime
  end
end
