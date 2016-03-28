class AddDeadlineForMission < ActiveRecord::Migration
  def change
    add_column :missions, :deadline, :date
  end
end
