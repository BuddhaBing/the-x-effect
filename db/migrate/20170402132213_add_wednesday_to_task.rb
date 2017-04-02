class AddWednesdayToTask < ActiveRecord::Migration[5.0]
  def change
    add_column :tasks, :wednesday, :boolean
  end
end
