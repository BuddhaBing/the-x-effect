class CreateActiveDates < ActiveRecord::Migration[5.0]
  def change
    create_table :active_dates do |t|
      t.date :task_date
      t.boolean :completed

      t.timestamps
    end
  end
end
