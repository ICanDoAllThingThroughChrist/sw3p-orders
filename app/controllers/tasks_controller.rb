class TasksController < ApplicationController
    def index
        if params[:user_id]
            @users = User.find(params[:user_id]).tasks
        else
            @tasks = Task.all
        end 
    end 
    
    def show
        @task = Task.find(params[:id])
    end
    
end
