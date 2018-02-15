class TasksController < ApplicationController
  before_action :logged_in?, only: [:new, :create, :show, :edit, :update, :destroy]
  attr_accessor :paramsid
    def paramsid
        @task = Task.find_by(params[:id])
        params[:id]= @task.id
    end
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
      self.paramsid
      binding.pry
      if @task.save
          self.paramsid
          #binding.pry
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
       @tasks = Task.all
       @site = Site.find_by(params[:site_id])
       self.paramsid
       @task = Task.find(params[:id])
    end
     
    def edit
      if current_user
          self.paramsid
          @task = Task.find(params[:id])
          redirect_to edit_site_task
      else
          redirect_to site_tasks
      end
    end
  
    def update
      self.paramsid
      @task = Task.find(params[:id])
      authorize @task
    # perform an update
    end
    private 
    def task_params
        params.require(:task).permit(:id, :name, :user_id, :deadline, :status_report, site_ids:[], sites_attributes: [:name])
    end
end
