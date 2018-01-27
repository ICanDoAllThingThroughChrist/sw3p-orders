class OrdersController < ApplicationController
    #helper_method :params
   
    def new 
        @user = current_user
        @order = @user.orders.build
        @order.comments.build
        @tasks = @order.tasks.build
        #https://github.com/learn-co-curriculum/expedition-maker-2017/blob/solution-part-two/app/controllers/expeditions_controller.rb
        # @order.tasks.build(name: '')
        # @order.sites.build(name: '')
    end 

    def create
        #binding.pry
        #raise.params.inspect
        #https://agilewarrior.wordpress.com/2011/10/22/rails-drop-downs/
        #binding.pry
        @order = Order.new(order_params) 
        #binding.pry
        if @order.save
            binding.pry
            redirect_to orders_path(@order)
        else
            render new_user_order_path 
        end
    end 
    def index 
        binding.pry
        @user = current_user.id
        @orders = Order.by_author(current_user.id)   
    end 
    private 
    def order_params
        params.require(:order).permit(:user_id, :task, :site, :deadline, :frequency, :comments_attributes => [:comment], :tasks_attributes => [:name])
    end 
    #https://learn.co/tracks/full-stack-web-development-v3/rails/routes-and-resources/modifying-nested-resources
end

