class OrdersController < ApplicationController
    protect_from_forgery prepend: true
    #protect_from_forgery with: :exception
    #helper_method :params
    #attr_accessor :paramsid
    def paramsid
        @order = Order.find_by(params[:id])
        params[:id]= @order.id
    end
    def new 
        @site = Site.find(params[:site_id])
        #binding.prqy
        @user = current_user 
        @order = @user.orders.build
        binding.pry
        @order.site = @site#@supplier.account = @account, http://guides.rubyonrails.org/v2.3.11/association_basics.html
        @comment = Comment.all
        #3.times {@order.attachments.build}
    end 

    def create
        #binding.pry
        #raise.params.inspect #https://agilewarrior.wordpress.com/2011/10/22/rails-drop-downs/
        binding.pry
        @order = Order.new(order_params) 
        binding.pry
        if @order.save
            binding.pry
            flash[:notice]  = "order saved"
            redirect_to site_orders_url
        else
            binding.pry
            flash[:notice]  = "Could not save order"
            redirect_to site_orders_url 
        end
    end 

    def index 
        binding.pry
        @user = current_user.id
        @orders = Order.by_author(current_user.id) 
        if current_user
            binding.pry
            if !params[:task].blank? 
                if params[:task] == "task1"
                    @orders= Order.all 
                    @orderstask1= @orders.task1
                    @orderstask1 
                    render :file => 'app/views/orders/ordertask1.html.erb'
                elsif params[:task] == "task2"
                    @orders= Order.all 
                    @orderstask2= @orders.task2
                    @orderstask2 
                    render :file => 'app/views/orders/ordertask2.html.erb'
                end 
            elsif !params[:site_name].blank?
                binding.pry
                if params[:site_name] == "NE"
                    @orders= Order.all 
                    @ordersne= @orders.ne 
                    @ordersne 
                    render :file => 'app/views/orders/ordersne.html.erb'
                elsif params[:site_name] == "NW"
                    @orders= Order.all 
                    @ordersnw= @orders.nw 
                    @ordersnw 
                    render :file => 'app/views/orders/ordersnw.html.erb'
                elsif params[:site_name] == "SW"
                    @orders= Order.all 
                    @orderssw= @orders.sw 
                    @orderssw 
                    render :file => 'app/views/orders/orderssw.html.erb'
                elsif params[:site_name] == "SE"
                    @orders= Order.all 
                    @ordersse= @orders.se
                    @ordersse 
                    render :file => 'app/views/orders/ordersse.html.erb'
                elsif params[:site_name] == "NW_Transfer_Station"
                    @orders= Order.all 
                    @ordersnw_ts= @orders.nwtransferstation 
                    @ordersnw_ts 
                    render :file => 'app/views/orders/ordernw_ts.html.erb'
                elsif params[:site_name] == "SW_Transfer_Station"
                    @orders= Order.all 
                    @orderssw_ts= @orders.swtransferstation 
                    @orderssw_ts 
                    render :file => 'app/views/orders/ordersw_ts.html.erb'
                elsif params[:site_name] == "SE_Transfer_Station"
                    @orders= Order.all 
                    @ordersse_ts= @orders.setransferstation 
                    @ordersse_ts 
                    render :file => 'app/views/orders/orderse_ts.html.erb'
                end 
            end 
        else
            @orders
            redirect_to site_orders_url
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
    def destroy
        @order = Order.find(params[:id]) 
        @order.destroy
        flash[:success] = "Order Deleted"
        render :index 
    end 
 
    private 
    def order_params
        params.require(:order).permit(:file, :attachment, :attachment_cache, :id, :which_comment, :site_id, :user_id,
        :task, :site, :deadline, :frequency, :comment_names,
        :new_comment, :status,:comments_attributes => [:id, :comment_id, :comment, :task, :names], 
        :attachment_attributes => [:file, :file_cache])#https://stackoverflow.com/questions/19270518/edit-nested-in-a-form
    end 
    #https://learn.co/tracks/full-stack-web-development-v3/rails/routes-and-resources/modifying-nested-resources
end

   