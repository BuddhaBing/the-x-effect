class AddTaskIdToActiveDate < ActiveRecord::Migration[5.0]
  def change
    add_reference :active_dates, :task, foreign_key: true
  end
end
