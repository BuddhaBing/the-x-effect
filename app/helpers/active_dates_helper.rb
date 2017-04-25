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

  def day_of_month(date)
    date.mday
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
    dates << month if !month.empty?
    return dates
  end

  def square_class(date)
    date == Date.today ? 'cal-square today' : 'cal-square'
  end

  def date_class(task, date)
    return 'complete' if completed_date?(task, date)
    return 'missed' if !completed_date?(task, date) && marked_date?(task, date)
    task.active_day?(date) ? 'active-date' : 'inactive-date'
  end

  def show_actions?(task, date)
    task.active_day?(date) && date <= Date.today && !marked_date?(task, date)
  end

  def marked_date?(task, date)
    date = task.active_dates.find_by(task_id: date)
    date.completed != nil if date
  end

  def completed_date?(task, date)
    date = task.active_dates.find_by(task_date: date)
    date.completed if date
  end

end
