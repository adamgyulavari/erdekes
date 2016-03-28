class AddVisibility < ActiveRecord::Migration
  def change
    add_column :courses, :visibility, :string, default: "public"
    add_column :lessons, :visibility, :string, default: "public"
    add_column :missions, :visibility, :string, default: "public"
    add_column :sections, :visibility, :string, default: "public"
  end
end
