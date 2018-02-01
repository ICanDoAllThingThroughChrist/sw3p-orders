class OrdersController < ApplicationController
    #helper_method :params
   
    def new 
        @site = Site.find(params[:site_id])
        #binding.pry
        @user = current_user
        binding.pry
        @order = @user.orders.build
        @order.comments.build
        #@book.reload_author is used where collection of authors where to be selected under books#new form
        @order.site = @site#@supplier.account = @account, http://guides.rubyonrails.org/v2.3.11/association_basics.html
        binding.pry
        #@sites = Site.all 
        @nocomment = "no comment"
        #@author = @book.reload_author
        #http://guides.rubyonrails.org/association_basics.html#belongs-to-association-reference
        #@order._build.site
        #@order.tasks.build
        #https://github.com/learn-co-curriculum/expedition-maker-2017/blob/solution-part-two/app/controllers/expeditions_controller.rb
        # @order.tasks.build(name: '')
        # @order.sites.build(name: '')
    end 

    def create
        #binding.pry
        #raise.params.inspect
        #https://agilewarrior.wordpress.com/2011/10/22/rails-drop-downs/
        binding.pry
        @order = Order.new(order_params) 
        binding.pry
        if @order.save
            binding.pry
            redirect_to site_orders_url
        else
            flash.now[:error] = "Could not save order"
            render new_site_order_path 
        end
    end 

    def index 
        binding.pry
        @user = current_user.id
        @orders = Order.by_author(current_user.id)   
    end 

    def show
        binding.pry 
        if current_user
            @order = Order.find(params[:id])
            binding.pry
        else
            flash[:notice] = "Requested Order does not belong to current user"#http://guides.rubyonrails.org/action_controller_overview.html
            redirect_to user_orders_path 
        end 
    end 

    def edit
        binding.pry
       if params[:order_id]
        @order = Order.find(params[:order_id])
        render :edit
       else params[:id]
        @order = Order.find(params[:id])
       end 
    end
    
    def update
        if params[:order_id]
         @order = Order.find(params[:order_id])
        else params[:id]
         @order = Order.find(params[:id])
        end 
    end 

    private 
    def order_params
        params.require(:order).permit(:order_id, :site_id,:user_id, :task, :site, :deadline, :frequency, :comments_attributes => [:comment])
    end 
    #https://learn.co/tracks/full-stack-web-development-v3/rails/routes-and-resources/modifying-nested-resources
end

