class AddFridayToTask < ActiveRecord::Migration[5.0]
  def change
    add_column :tasks, :friday, :boolean
  end
end
