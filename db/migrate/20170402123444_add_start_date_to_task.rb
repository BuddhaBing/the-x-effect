class AddStartDateToTask < ActiveRecord::Migration[5.0]
  def change
    add_column :tasks, :start_date, :date
  end
end
