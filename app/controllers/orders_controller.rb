class OrdersController < ApplicationController
    def index 
        @orders = Order.all 
    end 
    def new 
        @user = User.find(params[:user_id])
        @order = @user.orders.build
    end 

    def create 
    end 
    
    private 
    def order_params 
        params.require(:order).permit(:task_ids,:order_ids,:user_id)
    end 
    #https://learn.co/tracks/full-stack-web-development-v3/rails/routes-and-resources/modifying-nested-resources
end
