module ActiveDatesHelper

  DAYS_OF_WEEK = %w(Mon Tues Weds Thurs Fri Sat Sun)

  def days_of_week
    DAYS_OF_WEEK
  end

  def pretty_date(date)
    date.strftime("%d/%m/%y")
  end

  def increment_start_day(start_day)
    start_day == 7 ? start_day = 1 : start_day += 1
  end

  def get_numerical_month(date)
    date.mon
  end

  def get_numerical_year(date)
    date.year
  end

  def pretty_month(date)
    date.strftime("%B")
  end

end
