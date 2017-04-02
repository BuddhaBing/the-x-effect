class AddSaturdayToTask < ActiveRecord::Migration[5.0]
  def change
    add_column :tasks, :saturday, :boolean
  end
end
