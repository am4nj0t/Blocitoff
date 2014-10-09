class ItemsController < ApplicationController
  def create
  	@item = Item.new(item_params)
  	@task = Task.find(params[:task_id])
  	#@item.task = @task
  	@items = current_user.items
  	if @item.save
		flash[:notice] = "Item was saved successfully"
	else 
		flash[:notice] = "There was a problem, try again."
	end
	redirect_to task_path(@task)		
  end

  def index
  	@task = Task.find(params[:task_id])
  	@items = @task.items
  end

  def new
  	@item = Item.new
  end

  def show
  	@item = Item.find(params[:id])
  end

  private 

  def item_params
  	params.require(:item).permit(:description, :task)
  end
end
