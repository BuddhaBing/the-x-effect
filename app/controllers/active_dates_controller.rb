class ActiveDatesController < ApplicationController
  def index
  end

  def new
  end

  def create
  end

  def update
    task = Task.find(params[:task_id])
    active_date = ActiveDate.find(params[:date_id])
    active_date.completed = true
    active_date.save
  end

end
