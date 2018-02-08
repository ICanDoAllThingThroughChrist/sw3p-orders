class UsersController < ApplicationController
   # before_action :set_user, only: [:show, :edit, :update, :destroy]
   def show
    @user = User.find(params[:id])
       #debugger
       #@user = User.find(params[:id])
   end
   def index
    @site = Site.all
   end

    def new
      @user = User.new
      #@user = User.new
    end

    def create
      @user = User.new(user_params)
      #@user = User.new(user_params)
      binding.pry 
      if @user.save
        #binding.pry
        flash[:success] = "Welcome to the Sample App!"
        redirect_to user_url(@user)
        #debugger
      else
        render "new"
      end
    end

    private 
    def user_params 
        params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end 
    def set_user
        @user = User.find(params[:id])
    end
end
