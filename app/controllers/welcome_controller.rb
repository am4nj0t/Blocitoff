class WelcomeController < ApplicationController
  def index
  	@tasks = Task.all
  end

  def show
  	@task = Task.find(params[:task])
  end	
end
