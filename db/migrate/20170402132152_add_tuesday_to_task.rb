class AddTuesdayToTask < ActiveRecord::Migration[5.0]
  def change
    add_column :tasks, :tuesday, :boolean
  end
end
