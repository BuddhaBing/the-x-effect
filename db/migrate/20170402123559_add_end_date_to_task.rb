class AddEndDateToTask < ActiveRecord::Migration[5.0]
  def change
    add_column :tasks, :end_date, :date
  end
end
