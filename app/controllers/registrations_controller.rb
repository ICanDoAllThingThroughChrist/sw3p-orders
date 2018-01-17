class RegistrationsController < ApplicationController
	def new 
		@user = User.new
	end 
	def create
		@user = User.new(user_params)
		#binding.pry
		if @user.save 
			session[:user_id] = @user.id 
			redirect_to sites_path 
		else 
			render :new 
		end 
	end 
	private 
	def user_params
		params.require(:user).permit(:name, :email, :password)
	end
end
