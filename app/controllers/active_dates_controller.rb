class ActiveDatesController < ApplicationController

  respond_to :html, :js

  def index
  end

  def new
  end

  def create
  end

  def update
    task = Task.find(params[:task_id])
    active_date = task.active_dates.find_by(task_date: params[:task_date])
    active_date.completed = params[:completed]
    redirect_to task
    if active_date.save
      flash[:notice] = active_date.completed ? "Awesome! Keep it up!" : "Aw shucks!"
    else
      flash[:alert] = active_date.errors.full_messages
    end
  end

end
