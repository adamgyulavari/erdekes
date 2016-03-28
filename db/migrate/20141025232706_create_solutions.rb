class CreateSolutions < ActiveRecord::Migration
  def change
    create_table :solutions do |t|
      t.integer :student_id
      t.integer :mission_id
      t.string :source_uid
      t.string :visibility, default: 'private'

      t.timestamps
    end
  end
end
