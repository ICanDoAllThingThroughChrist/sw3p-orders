class ApplicationController < ActionController::Base
  include Pundit  # add this line
  protect_from_forgery with: :exception
  include SessionsHelper
end
