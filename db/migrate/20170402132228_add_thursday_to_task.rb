class AddThursdayToTask < ActiveRecord::Migration[5.0]
  def change
    add_column :tasks, :thursday, :boolean
  end
end
