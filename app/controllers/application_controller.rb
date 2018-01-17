class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_user,:is_logged_in, :authenticate_user!, :is_admin?, :redirect_if_not_admin!

     def current_user
      @current_user ||= User.find_by(id: session[:user_id])
     end

    def is_logged_in?
      !!current_user
    end

    def authenticate_user!
      redirect_to new_session_path if !is_logged_in?
    end

    def is_admin? 
      if current_user.admin && !current_user.admin
        binding.pry
        redirect_to site_path 
      end
    end 

    def redirect_if_not_admin!
      if !is_admin?
        redirect_to sites_path 
      end 
    end 

end
