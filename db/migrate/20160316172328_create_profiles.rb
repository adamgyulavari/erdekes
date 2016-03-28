class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.string :avatar_uid
      t.string :first_name
      t.string :last_name
      t.string :nick_name
      t.string :image_url
      t.integer :user_id
      t.string :user_type
    end
  end
end
