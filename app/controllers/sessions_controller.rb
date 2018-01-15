class SessionsController < ApplicationController
    def new 
        @user = User.new 
    end 

    # def create
    #         @user = User.find_or_create_by(uid: auth['uid']) do |u|
    #           u.name = auth['info']['name']
    #           u.email = auth['info']['email']
    #           u.image = auth['info']['image']
    #         end
    #         session[:user_id] = @user.id    
    #         render 'welcome/home'
    # end

    def create
            @user = User.find_by(username: params[:username])
            return head(:forbidden) unless @user.authenticate(params[:password])
            session[:user_id] = @user.id
    end


    def destroy
        session.delete :user_id   
        redirect_to '/'
    end
    private
    def auth
        request.env['omniauth.auth']
    end
end