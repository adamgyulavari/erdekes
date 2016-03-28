class CreateMissions < ActiveRecord::Migration
  def change
    create_table :missions do |t|
      t.string :name
      t.text :description
      t.string :objectives_uid
      t.integer :section_id

      t.timestamps
    end
  end
end
