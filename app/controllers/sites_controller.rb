class SitesController < ApplicationController
    def index
        @site = Site.all
    end
    def new 
        @site = Site.new 
        @task = Task.all
    end
    def create
        binding.pry
        @site = Site.new(site_params)
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
        params.require(:site).permit(:name, task: [:name], task_ids: [])
    end 
end
