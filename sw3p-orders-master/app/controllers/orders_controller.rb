class OrdersController < ApplicationController
    #helper_method :params
   
    def new 
        @site = Site.find(params[:site_id])
        #binding.prqy
        @user = current_user 
        @order = @user.orders.build
        @order.site = @site#@supplier.account = @account, http://guides.rubyonrails.org/v2.3.11/association_basics.html
        @comment = Comment.all
    end 

    def create
        #binding.pry
        #raise.params.inspect #https://agilewarrior.wordpress.com/2011/10/22/rails-drop-downs/
        binding.pry
        @order = Order.new(order_params) 
        binding.pry
        if @order.save
            binding.pry
            redirect_to site_orders_url
        else
            binding.pry
            flash.now[:error] = "Could not save order"
            redirect_to site_orders_url 
        end
    end 

    def index 
        binding.pry
        if current_user
            @user = current_user.id
            @orders = Order.by_author(current_user.id) 
            render :index 
        else 
            redirect_to login_url
        end 
    end 

    def show
        binding.pry 
        if current_user
            @order = Order.find(params[:id])
            render :show#call show page
            binding.pry
        else
            flash[:notice] = "Requested Order does not belong to current user"#http://guides.rubyonrails.org/action_controller_overview.html
            redirect_to site_orders_path 
        end 
    end 

    def edit
        binding.pry
        @order = Order.find(params[:id])
    end
    
    def update
         binding.pry#https://stackoverflow.com/questions/19270518/edit-nested-in-a-form
         @order = Order.find(params[:id])
         if @order.update_attributes(order_params)
            flash[:success] = "Order Updated"
            redirect_to @order 
            binding.pry
         else 
            binding.pry
            render 'edit'
         end 
    end
 
    private 
    def order_params
        params.require(:order).permit(:id, :which_comment, :site_id, :user_id,
        :task, :site, :deadline, :frequency, :comment_names,  
        :comments_attributes => [:id, :comment_id, :comment, :comment_names])#https://stackoverflow.com/questions/19270518/edit-nested-in-a-form
    end 
    #https://learn.co/tracks/full-stack-web-development-v3/rails/routes-and-resources/modifying-nested-resources
end

   