class SitesController < ApplicationController
    before_action :logged_in?, only: [:new, :create, :index, :show]
    def index
        @site = Site.all
        task_ids = Task.all
        @site_filtered_task = Site.filter_by_task(task_ids)
        binding.pry
    end
    def new 
        @site = Site.find(params[:site_id])
        @user = current_user
        @site = Site.new 
        @site.tasks.build
        @task = Task.all
    end
    def create
        binding.pry
        @site = Site.new(site_params)
        binding.pry
        if @site.save 
            redirect_to sites_path
            binding.pry
        else 
            render :new 
        end 
    end

    def orders
        @site = Site.find_by(params[:id])
        @users = User.all
        @tasks = @site.tasks
    end
    
    def show 
        binding.pry#key to discover find instead of find_by method
        @site = Site.find(params[:id])#find instead of find_by worked
        binding.pry
        @task = @site.orders
    end 

    def sitetask
        @site = Site.all
    end 
    private 
    def site_params
        #binding.pry
        params.require(:site).permit(:site_id, :name, :task_ids, task_attributes: [:name])
        # params.require(:expedition).permit(:name, :description, :length, :difficulty, equipment: [:name])
    end 

end
# [2] pry(#<SitesController>)> params
# => { "site"=> 
#     {"name"=>"NE Service Center", 
#     "task_ids"=>"1", 
#     "tasks"=>{"name"=>"2"}}
  
#    :name,
#     addresses_attributes: [
#       :street_address_1,
#       :street_address_2,
#       :city,
#       :state,
#       :zipcode,
#       :address_type
#     ] 
# { "site"=> {"name"=>"NE Service Center", "task_ids"=>"1", "tasks"=>{"name"=>"2"}} }

#http://weblog.rubyonrails.org/2009/1/26/nested-model-forms/
# { "site"=>
#     {"name"=>"westpark", 
#     "task_ids"=> [], 
#     "tasks_attributes"=>
#         [] =>
#             {"name"=>"3"}
#     }
#     }
# }
# params.require(:site).permit(:name,
#       :task_ids => [],
#       :tasks_attributes => [:id, :content, :participant_id]
#       ])
#addresses_attributes: [
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
# before_action :set_survey, only: [:show, :edit, :update, :destroy, :answers]

# # ... ignoring content that hasn't changed from scaffold


# # Survey|Site
# def survey_params
#     params.require(:survey).permit(:name,
#       :questions_attributes => 
#       [:id, :content,
#        :answers_attributes => [:id, :content, :participant_id]
#       ])
# end