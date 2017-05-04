module TasksHelper
  include ActiveDatesHelper
  include ActsAsTaggableOn::TagsHelper

  def active_tasks
    @tasks.select { |task| task.active? }.sort_by(&:start_date)
  end

  def inactive_tasks
    @tasks.select { |task| !task.active? }.sort_by(&:start_date).reverse
  end

  def total_days_complete
    @tasks.map { |task| task.days_complete }.reduce { |sum, days| sum + days }
  end

  def total_days_missed
    @tasks.map { |task| task.days_missed }.reduce { |sum, days| sum + days }
  end

  def total_unmarked_days
    @tasks.map { |task| task.unmarked_days }.reduce { |sum, days| sum + days }
  end

  def best_overall_streak
    @tasks.map { |task| task.best_streak }.max
  end

  def overall_percent_complete_to_date
    arr = @tasks.map { |task| task.percent_complete_to_date.gsub(/%/, "").to_f }
    total = arr.reduce { |sum, percent| sum + percent } / @tasks.size
    "#{number_with_precision(total, precision: 2)}%"
  end

end
