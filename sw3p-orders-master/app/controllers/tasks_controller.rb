class TasksController < ApplicationController
  before_action :logged_in?, only: [:new, :create, :show, :edit, :update, :destroy]
  attr_accessor :paramsid
  #params[:id]= @task.id
    def new
          @task = Task.new
          #@task = Task.create#tried create to solve missing [:id] in params by saving records, but
          @user= current_user
          @task.user_id= @user.id
          binding.pry
    end
    # def paramsid
    #     binding.pry
    #     @task = Task.find(params[:id])
    #     params[:id]= @task.id
    # end
    def create
      #raise.params.inspect
      #binding.pry
      @task = Task.create(task_params)#task params called missing column tasks.site_ids
      self.paramsid
      binding.pry
      if @task.save
          self.paramsid
          binding.pry
          redirect_to site_tasks_url
      else 
        render :new 
      end 
    end 
    def index
        binding.pry
        @site= Site.find(params[:site_id])
        @tasks= @site.tasks#needs revision for User!=Many Tasks
        counter = 0
        if current_user #https://ruby-doc.org/core-2.1.4/doc/syntax/control_expressions_rdoc.html
          binding.pry
           # filter the @tasks list based on user input
          #binding.pry
            if !params[:deadline].blank?#https://learn.co/tracks/full-stack-web-development-v3/rails/refactoring-with-helpers-and-model-methods/model-class-methods
                binding.pry
                if params[:deadline] == "December 2018"
                    @site= Site.find(params[:site_id])
                    @tasks= @site.tasks#needs revision for User!=Many Tasks
                    @taskdec18= @tasks.december_2018
                    @taskdec18
                    render :file => 'app/views/tasks/taskdec18.html.erb'
                else
                    @site= Site.find(params[:site_id])
                    @tasks= @site.tasks#needs revision for User!=Many Tasks
                    @taskjun18= @tasks.june_2018
                    @taskjun18
                    render :file => 'app/views/tasks/taskjune18.html.erb'
                end
            elsif !params[:task_status].blank?
            binding.pry
                if params[:task_status] == "in progress"
                    @site= Site.find(params[:site_id])
                    @tasks= @site.tasks#needs revision for User!=Many Tasks
                    @taskinprogress= @tasks.in_progress
                    @taskinprogress
                    render :file => 'app/views/tasks/taskinprogress.html.erb'
                else
                    @site= Site.find(params[:site_id])
                    @tasks= @site.tasks#needs revision for User!=Many Tasks
                    @taskcompleted= @tasks.completed
                    @taskcompleted
                    render :file => 'app/views/tasks/taskcomplete.html.erb'
                end 
                # if no filters are applied, show all posts
            else
                @tasks#
            end
        end
    end
    
    def show
       @tasks = Task.all
       @site = Site.find_by(params[:site_id])
       #self.paramsid
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
