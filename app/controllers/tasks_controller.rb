class TasksController < ApplicationController
    def new
        if params[:user_id] && !User.exists?(params[:user_id])
          redirect_to users_path, alert: "User not found."
        else
          @task = Task.new(user_id: params[:user_id])
        end
      end
    def index
  # provide a list of users to the view for the filter control
        @users = User.all   
        if params[:user_id]
            @tasks = User.find(params[:user_id]).tasks
          else
            @tasks = Task.all
          end
        # filter the @tasks list based on user input
        if !params[:user].blank?
            @tasks = Task.by_user(params[:user])
        elsif !params[:date].blank?
            if params[:date] == "Today"
            @tasks = Task.from_today
            else
            @tasks = Task.old_news
            end
        else
            # if no filters are applied, show all tasks
            @tasks = Task.all
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
          @post = user.posts.find_by(id: params[:id])
          redirect_to user_tasks_path(user), alert: "Task not found." if @task.nil?
        end
      else
        @post = Post.find(params[:id])
      end
    end
  
    def update
      @post = Post.find(params[:id])
      authorize @post
    # perform an update
    end

    def task_params
        params.require(:task).permit(:name, :user_id)
      end
end
