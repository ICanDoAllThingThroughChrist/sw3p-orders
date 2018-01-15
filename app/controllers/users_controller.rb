class UsersController < ApplicationController
    before_action :set_user, only: [:show, :edit, :update, :destroy]
    def new 
        @user = User.new
    end 
    
    def create
        @user = User.new(user_params)
        if @user.save
          session[:user_id] = @user.id
          redirect_to '/'
        else
          #raise params
          redirect_to new_user_path, notice: "name is not unique"
          #raise params
        end
      end

    private 
    def user_params 
        params.require(:user).permit(:name, :password, :password_confirmation)
    end 
    def set_user
        @user = User.find(params[:id])
    end
end
