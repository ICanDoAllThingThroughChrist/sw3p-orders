class UsersController < ApplicationController
   # before_action :set_user, only: [:show, :edit, :update, :destroy]
    def new 
        @user = User.new
    end 
    
    def create
        @user = User.new(user_params).save
        #binding.pry
        session[:user_id] = @user.id
        redirect_to '/'
      end

    private 
    def user_params 
        params.require(:user).permit(:name, :password, :password_confirmation)
    end 
    def set_user
        @user = User.find(params[:id])
    end
end
