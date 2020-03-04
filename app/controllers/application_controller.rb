class ApplicationController < ActionController::Base
  helper_method :current_user 
  def current_user 
    User.find_by_id(session[:current_user_id]) if session[:current_user_id]
  end 
end
