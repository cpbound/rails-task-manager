class TasksController < ApplicationController
  # CRUD actions here

  # Create
  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)
    if @task.save
      redirect_to task_path(@task)
    else
      render 'new.htm.erb'
    end
  end

  # Read
  # Read all
  def index
    @tasks = Task.all
  end

  # Read one
  def show
    @task = Task.find(params[:id]) # ←←This is the form
  end

  # Update
  def edit
    @task = Task.find(params[:id]) # ←←This is the form
  end

  def update
    @task = Task.find(params[:id]) # ←←This is the form
    if @task.update(task_params)
      redirect_to task_path(@task)
    else
      render 'edit.html.erb'
    end
  end

  # Destroy
  def destroy
    @task = Task.find(params[:id])
    @task.destroy
    redirect_to tasks_path
  end

  private

  def task_params
    # Strong params - whitelisting the params i want to accept
    params.require(:task).permit(:title, :details, :completed)
  end

end
