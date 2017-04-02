class TasksController < ApplicationController
  before_action :authenticate_user!

  def index
    @tasks = Task.all
  end

  def new
    @task = Task.new
  end

  def create
    task = current_user.tasks.build(task_params)
    if task.save
      redirect_back(fallback_location: authenticated_root_path)
    else
      redirect_back(fallback_location: new_task_path)
      flash[:alert] = task.errors.full_messages
    end
  end

  private

  def task_params
    params.require(:task).permit(:name, :start_date, :end_date, :monday,
                                 :tuesday, :wednesday, :thursday, :friday,
                                 :saturday, :sunday)
  end

end