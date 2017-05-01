class Task < ApplicationRecord
  belongs_to :user
  has_many :active_dates, dependent: :destroy
  acts_as_taggable

  validates_presence_of :name, :start_date, :end_date
  validates_length_of :name, maximum: 50
  validates_uniqueness_of :name, scope: :user_id

  validates_date :start_date, :on_or_after => :today,
                              :on_or_after_message => "can't be in the past"

  validates_date :end_date, :on_or_after => :start_date, :on_or_before => lambda { 5.years.since },
                               :on_or_after_message => "can't be before the start date",
                               :on_or_before_message => "can only be a maximum of 5 years in the future"


  def active?
    !end_date || end_date > Date.today
  end

  def active_day?(date)
    send(date.strftime("%A").downcase)
  end

  def days_complete
    active_dates.where(completed: true).count
  end

  def days_missed
    active_dates.where(completed: false).count
  end

  def days_remaining
    active_dates.where(completed: nil).count
  end

  def current_streak
    last_marked_date = active_dates.where.not(completed: nil).last
    p last_marked_date
    return 0 if !last_marked_date || last_marked_date.completed == false
    dates = active_dates.where(completed: true).reverse
    dates.take_while { |date| date.completed }.size
  end

end
