class SessionsController < ApplicationController

    def new
      @user = User.new
    end

    def create2
        @user = User.find_or_create_by(uid: auth['uid']) do |u|
        u.name = auth['info']['name']
        u.email = auth['info']['email']
        u.image = auth['info']['image']
        u.id = auth['uid']
        binding.pry
      end
      #binding.pry
      session[:user_id] = @user.id
      session[:email] = @user.email
      #@user = User.find_by(email: [:session][:email].downcase)
      binding.pry
      log_in @user
      binding.pry  
      render 'welcome/home'
      binding.pry
    end

    def create
      binding.pry
      @user = User.find_by(email: params[:session][:email].downcase)
      if @user && @user.authenticate(params[:session][:password])
       log_in @user
        redirect_to root_url
      else
        flash.now.alert = "Email or password is invalid"
        render "new"
      end
    end

    def destroy
        log_out
        redirect_to new_session_url
    end

    private
    def auth
        request.env['omniauth.auth']
    end
end