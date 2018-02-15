class TasksController < ApplicationController
  before_action :logged_in?, only: [:new, :create, :show, :edit, :update, :destroy]
  #params[:id]= @task.id
    def new
          @user = current_user
          @task = Task.new
          #@task = Task.create#tried create to solve missing [:id] in params by saving records, but
          @task.user_id= @user.id
          binding.pry
    end
    def create
      #raise.params.inspect
      #binding.pry
      @task = Task.create(task_params)#task params called missing column tasks.site_ids
      binding.pry
      if @task.save
          params[:id]= @task.id
          binding.pry
          redirect_to site_tasks_url
      else 
        render :new 
      end 
    end 
    def index
        binding.pry
        if current_user
          binding.pry
            @tasks = Task.all#needs revision for User!=Many Tasks
        end
    end
    
    def show
       @task = Task.find(@task.id)
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
        params.require(:task).permit(:id, :name, :user_id, :deadline, :status_report, site_ids:[], sites_attributes: [:name])
    end
end
