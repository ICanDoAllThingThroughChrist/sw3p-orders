class SitesController < ApplicationController
    def index
        @site = Site.all
    end
    def new 
        @site = Site.new 
    end
    def create
        binding.pry
    end 

    private 
    def site_params
        params.require(:site).permit(:name, task: [:name])
    end 
end

