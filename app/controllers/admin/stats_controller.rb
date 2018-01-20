class Admin::StatsController < ApplicationController

    def index
      @task_count = Task.count
      @users_count = User.count
      @last_task = Task.last
    end
  end