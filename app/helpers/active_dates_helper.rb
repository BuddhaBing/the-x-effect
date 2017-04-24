module ActiveDatesHelper

  DAYS_OF_WEEK = %w(Mon Tues Weds Thurs Fri Sat Sun)

  def days_of_week
    DAYS_OF_WEEK
  end

  def pretty_date(date)
    date.strftime("%d/%m/%y")
  end

  def pretty_month(date)
    date.strftime("%B")
  end

  def array_of_months(date_range)
    dates = []
    month = []
    date_range.each do |date|
      if date.mday == 1 && !month.empty?
        dates << month
        month = []
      else
        month << date
      end
    end
    return dates
  end

end
