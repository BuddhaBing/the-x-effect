class Task < ApplicationRecord
  belongs_to :user

  validates_presence_of :name, :start_date
  validates_length_of :name, maximum: 30

  validates_date :start_date, :on_or_after => :today,
                              :on_or_after_message => "cannot be in the past"

  validates_date :end_date, :on_or_after => :start_date,
                               :before_message => "cannot be before start date"
end
