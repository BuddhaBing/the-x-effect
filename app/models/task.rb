class Task < ApplicationRecord
  belongs_to :user
  has_many :active_dates, dependent: :destroy

  validates_presence_of :name, :start_date
  validates_length_of :name, maximum: 30
  validates_uniqueness_of :name, scope: :user_id

  validates_date :start_date, :on_or_after => :today,
                              :on_or_after_message => "can't be in the past"

  validates_date :end_date, :on_or_after => :start_date, :on_or_before => lambda { 10.years.since },
                               :on_or_after_message => "can't be before the start date",
                               :on_or_before_message => "can only be a maximum of 10 years in the future"

  def active
    !end_date || end_date > Date.today
  end

  def active_day(date)
    send(date.strftime("%A").downcase)
  end

end
