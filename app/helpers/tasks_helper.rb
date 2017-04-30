module TasksHelper
  include ActiveDatesHelper
  include ActsAsTaggableOn::TagsHelper

  def active_tasks
    @tasks.select { |task| task.active? }.sort_by(&:start_date)
  end

  def inactive_tasks
    @tasks.select { |task| !task.active? }.sort_by(&:start_date).reverse
  end

end
