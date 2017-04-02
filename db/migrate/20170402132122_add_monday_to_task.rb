class AddMondayToTask < ActiveRecord::Migration[5.0]
  def change
    add_column :tasks, :monday, :boolean
  end
end
