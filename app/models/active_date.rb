class ActiveDate < ApplicationRecord
  belongs_to :task
  validates_presence_of :task_date
  
end
