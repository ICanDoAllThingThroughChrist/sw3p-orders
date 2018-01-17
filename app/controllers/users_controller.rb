class UsersController < ApplicationController
   # before_action :set_user, only: [:show, :edit, :update, :destroy]
   def show
    @user = User.find(params[:id])
       #debugger
   end
   def index
    @site = Site.all
   end

    def new
      @user = User.new
    end

    def create
      @user = User.new(user_params)
      #binding.pry 
      if @user.save
        #binding.pry
        session[:user_id] = @user.id
        redirect_to sites_url, notice: "Thank you for signing up!"
        #debugger
      else
        render "new"
      end
    end

    private 
    def user_params 
        params.require(:user).permit(:name, :email, :password)
    end 
    def set_user
        @user = User.find(params[:id])
    end
end
