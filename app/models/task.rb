class Task < ApplicationRecord
  belongs_to :user

  validates_presence_of :name, :start_date
  validates_length_of :name, maximum: 30
  validates_uniqueness_of :name, scope: :user_id

  validates_date :start_date, :on_or_after => :today,
                              :on_or_after_message => "can't be in the past"

  validates_date :end_date, :on_or_after => :start_date,
                               :on_or_after_message => "can't be before the start date"

  def active
    !end_date || end_date > Date.today
  end

  def active_day

  end

end
