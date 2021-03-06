class TasksController < ApplicationController

  def index
    sleep 1
    @complete_tasks = Task.where(complete: true)
    @incomplete_tasks = Task.where(complete: false)
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.create(task_params)
    redirect_to tasks_url
  end

  def update
    @task = Task.find(params[:id])
    @task.update_attributes(task_params)
    redirect_to tasks_url
  end

  def destroy
    @task = Task.destroy(params[:id])
    redirect_to tasks_url
  end

  private

  def task_params
    params.require(:task).permit(:name, :complete)
  end

end
