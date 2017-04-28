class TasksController < ApplicationController
  before_action :set_task, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  include ActiveDatesHelper

  respond_to :html, :js

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
    @task = current_user.tasks.build(task_params)
    build_dates
    if @task.save
      redirect_to :authenticated_root, notice: 'Task successfully created.'
    else
      render :new, notice: @task.errors.full_messages
    end
  end

  def show
    dates = array_of_months(@task.start_date.upto(@task.end_date))
    @paginated_months = Kaminari.paginate_array(dates).page(params[:page]).per(1)
  end

  private

  def set_task
    @task = Task.find(params[:id])
  end

  def build_dates
    if @task.valid?
      @task.start_date.upto @task.end_date do |date|
        @task.active_dates.build(task_date: date) if @task.active_day?(date)
      end
    end
  end

  def task_params
    params.require(:task).permit(:name, :description, :start_date, :end_date, :monday,
                                 :tuesday, :wednesday, :thursday, :friday,
                                 :saturday, :sunday, :tag_list)
  end

end
