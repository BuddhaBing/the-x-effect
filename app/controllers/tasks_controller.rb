class TasksController < ApplicationController
  before_action :authenticate_user!

  respond_to do |format|
    format.html
    format.js
  end

  def tag_cloud
    @tags = Task.tag_counts_on(:tags)
  end

  def index
    @tags = ActsAsTaggableOn::Tag.all
    @tasks = Task.all
    params[:tag] ? @tasks = Task.tagged_with(params[:tag]) : @tasks = Task.all
  end

  def new
    @task = Task.new
  end

  def create
    task = current_user.tasks.build(task_params)
    task.start_date.upto task.end_date do |date|
      if task.active_day?(date)
        task.active_dates.build(task_date: date)
      end
    end
    if task.save
      redirect_to :authenticated_root
    else
      redirect_back(fallback_location: new_task_path)
      flash[:alert] = task.errors.full_messages
    end
  end

  def show
    @task = Task.find(params[:id])
    dates = array_of_months(@task.start_date.upto(@task.end_date))
    @paginated_months = Kaminari.paginate_array(dates).page(params[:page]).per(1)
  end

  private

  def task_params
    params.require(:task).permit(:name, :description, :start_date, :end_date, :monday,
                                 :tuesday, :wednesday, :thursday, :friday,
                                 :saturday, :sunday, :tag_list)
  end

end
