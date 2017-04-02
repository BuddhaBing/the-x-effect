class AddSundayToTask < ActiveRecord::Migration[5.0]
  def change
    add_column :tasks, :sunday, :boolean
  end
end
