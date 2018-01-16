class SitesController < ApplicationController
    before_action :redirect_if_not_admin!, only: [:new, :create]
    before_action :authenticate_user!, only: [:new, :create]

    def index
        @site = Site.all
    end
    def new 
        @site = Site.new 
        3.times do
            @site.task.build
        end
        @task = Task.all
    end
    def create
        #binding.pry
        @site = Site.new(site_params)
        #binding.pry
        if @site.save 
            redirect_to sites_path
        else 
            render :new 
        end 
    end
    # def show 
    #     @site = Site.find_by(params[:id])
    # end 

    private 
    def site_params
        params.require(:site).permit(:name, task_ids: [], task_attributes: [:name])
    end 

end
