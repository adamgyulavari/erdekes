class CreateLessons < ActiveRecord::Migration
  def change
    create_table :lessons do |t|
      t.string :name
      t.string :file_uid
      t.string :file_name
      t.integer :section_id

      t.timestamps
    end
  end
end
