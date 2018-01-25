class OrdersController < ApplicationController
    def index 
        @orders = Order.all 
    end 
    def new 
        @user = User.find(params[:user_id])
        @order = @user.orders.build
        # @order.tasks.build(name: '')
        # @order.sites.build(name: '')
    end 

    def create
        #binding.pry
        #raise.params.inspect
        #https://agilewarrior.wordpress.com/2011/10/22/rails-drop-downs/
        binding.pry
        @order << Order.new(order_params) 
        binding.pry
        if @order.save
            redirect_to user_orders_path(@order)
        else
            render new_user_order_path 
        end
    end 
    
    private 
    def order_params
        params.require(:order).permit(:user_id, :task, :site, :deadline, :frequency, :comments)
    end 
    #https://learn.co/tracks/full-stack-web-development-v3/rails/routes-and-resources/modifying-nested-resources
end

