class SitesController < ApplicationController
    before_action :logged_in?, only: [:new, :create, :index]
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
        binding.pry
        if @site.save 
            redirect_to sites_path
            binding.pry
        else 
            render :new 
        end 
    end
    def show 
        @site = Site.find_by(params[:id])
    end 

    private 
    def site_params
        params.require(:site).permit(:name, task_ids: [], task_attributes: [:name])
    end 

end
#             {"name"=>"NE Service Center",
#             "task_attributes"=> {"0"=>{"name"=>"1"}, 
#                                 "1"=>{"name"=>"2"}, 
#                                 "2"=>"name"=>"3"},
#                                 }
# }

# # To whitelist the following data:
# # {"book" => {"title" => "Some Book",
# #             "chapters_attributes" => { "1" => {"title" => "First Chapter"},
# #                                        "2" => {"title" => "Second Chapter"}}}}
# params.require(:book).permit(:title, chapters_attributes: [:title])