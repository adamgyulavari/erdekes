class AddResultToSolutions < ActiveRecord::Migration
  def change
    add_column :solutions, :result, :integer, default: 0
  end
end
