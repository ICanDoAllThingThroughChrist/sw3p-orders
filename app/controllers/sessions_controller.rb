class SessionsController < ApplicationController

    # def create
    #         @user = User.find_or_create_by(uid: auth['uid']) do |u|
    #           u.name = auth['info']['name']
    #           u.email = auth['info']['email']
    #           u.image = auth['info']['image']
    #         end
    #         session[:user_id] = @user.id    
    #         render 'welcome/home'
    # end

    def new
    end

    def create
      @user = User.find_by(email: params[:user][:email])
      if @user && @user.authenticate(params[:user][:password])
        session[:user_id] = @user.id
        redirect_to sites_url, notice: "Logged in!"
      else
        flash.now.alert = "Email or password is invalid"
        render "new"
      end
    end

    def destroy
      session[:user_id] = nil
      redirect_to root_url, notice: "Logged out!"
    end
    private
    def auth
        request.env['omniauth.auth']
    end
end