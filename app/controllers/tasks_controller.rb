class TasksController < ApplicationController
  def index
  	@tasks = Task.all
  end

  def show
  	@task = Task.find(params[:task])
  end

  def new
  	@task = Task.new
  end

  def create
  	@task = Task.new(params)[:task]
  		if @task.save
  			flash[:notice] = 'Task was successfully created.'
  			redirect_to :action => "index"
  		else
  			@task = Task.all
  			render :action => "index"
  		end	
  end
end
