class TasksController < ApplicationController
  def index
  	@tasks = current_user.tasks
  end

  def show
  	@task = Task.find(params[:id])
  	@item = Item.new
  end

  def new
  	@task = Task.new
  end

  def create
  	@task = Task.new(task_params)
  	@task.user = current_user
  	@tasks = current_user.tasks
  		if @task.save
  			flash[:notice] = 'Task was successfully created.'
  			redirect_to :action => "index"
  		else
  			flash[:notice] = 'There was a problem, try again.'
  			redirect_to new_task_path
  		end	
  end

  private

  def task_params
  	params.require(:task).permit(:description)
  end

  #generate a items migration 
  #items belong to tasks
  #add itesm aas a resource under your tasks in your routes
  # genreate your items models/controlers/view
  #add a button to your task list show - that allows the user to add items to the list.

end
