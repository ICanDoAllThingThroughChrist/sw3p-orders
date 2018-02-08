class OrdersController < ApplicationController
    #helper_method :params
   
    def new 
        @site = Site.find(params[:site_id])
        #binding.prqy
        @user = current_user
        binding.pry
        @order = @user.orders.build
        @order.site = @site#@supplier.account = @account, http://guides.rubyonrails.org/v2.3.11/association_basics.html
 
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
       if params[:order_id]
        @order = Order.find(params[:order_id])
        #@order.comments.update_attributes
        #render :edit "app did not hit this line after order edit completion, trying update"
        binding.pry
       else params[:id]
        binding.pry
        @order = Order.find(params[:id])
        #@order.comments.build
       end 
    end
    
    def update
         binding.pry
        if params[:id]
         binding.pry
         @order = Order.find(params[:id])#https://learn.co/tracks/full-stack-web-development-v3/rails/crud-with-rails/edit-update-action
         @order.update(order_params)#https://learn.co/tracks/full-stack-web-development-v3/rails/crud-with-rails/edit-update-action
         binding.pry
         @order.save
         redirect_to site_orders_url
        end 
    end 

    private 
    def order_params
        params.require(:order).permit(:site_id, :user_id,
        :task, :site, :deadline, :frequency,  
        :comments_attributes => [:id], :comments_attributes => [:comment])
    end 
    #https://learn.co/tracks/full-stack-web-development-v3/rails/routes-and-resources/modifying-nested-resources
end

     #@order.frequencies.build
        #@order.frequency.build
        #@order.deadlines.build
        #@order.statuse.build
        #@order.statuse.build
        # @order.build_task#https://stackoverflow.com/questions/2472982/using-build-with-a-has-one-association-in-rails
        # @order.build_frequencie
        # @order.build_deadline
        # @order.build_statuse     #  c = {"0" => order_params["comments_attributes"]["0"]["comment"]}
        #  @order.comments.each do |c|
        #     binding.pry
        #     c.comment = order_params["comments_attributes"]["0"]["comment"]
        #  end 
         #@order.comments.build
                   # if !@order.comments.empty?
            #     @order.comments.build(order_params)
                #@order.comments.build if !@order.comments.empty? #this builds a separate column/row cell in the row, i.e. failed
            # end
        #@author = @book.reload_author
        #http://guides.rubyonrails.org/association_basics.html#belongs-to-association-reference
        #@order._build.site
        #https://github.com/learn-co-curriculum/expedition-maker-2017/blob/solution-part-two/app/controllers/expeditions_controller.rb
        # @order.tasks.build(name: '')
        # @order.sites.build(name: '')
        # :task_attributes => [:id], :task_attributes => [:name], 
        # :statuse_attributes => [:id], :statuse_attributes => [:status], 
        # :deadline_attributes => [:id], :deadline_attributes => [:deadline], 
        # :frequency_attributes =>  [:id], :frequency_attributes => [:frequency], 
        #2.times { @order.comments.build}
        #@book.reload_author is used where collection of authors where to be selected under books#new form