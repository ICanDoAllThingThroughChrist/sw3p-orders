class TasksController < ApplicationController
  before_action :logged_in?, only: [:new, :show, :edit, :update, :destroy] 
    def new
          @user = current_user
          @task = Task.new
          binding.pry
    end
    def create
      binding.pry
      @task = Task.create(task_params)
      binding.pry
      if @task.save 
          redirect_to new_site_task_path(@task)
      else 
        render :new 
      end 
    end 
    def index
        if params[:user_id]
            @tasks = User.find(params[:user_id]).tasks
        end
    end
    
    def show
        @task = Task.find(params[:id])
    end
     
    def edit
      if params[:user_id]
        user = User.find_by(id: params[:user_id])
        if user.nil?
          redirect_to user_path, alert: "User not found."
        else
          @task = user.tasks.find_by(id: params[:id])
          redirect_to user_tasks_path(user), alert: "Task not found." if @task.nil?
        end
      else
        @task = Task.find(params[:id])
      end
    end
  
    def update
      @task = Task.find(params[:id])
      authorize @task
    # perform an update
    end
    private 
    
    def task_params
        params.require(:task).permit(:name, :user_id, site_ids:[], site_attributes: [:name])
    end
end
