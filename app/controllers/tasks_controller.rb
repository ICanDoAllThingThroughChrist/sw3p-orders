class TasksController < ApplicationController
    
    def index
  # provide a list of users to the view for the filter control
        @users = User.all   
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
    
end
