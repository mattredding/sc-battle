class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :login_from_session
  def logged_in?
    !!current_sc_user
  end
  
  def current_sc_user
    @current_sc_user
  end
  
  def login_as(user)
    @current_sc_user = user
    session[:current_sc_user_id] = user.try(:id)
  end
  
  def login_from_session
    @current_sc_user = User.find_by_id(session[:current_sc_user_id])
  end
  
end
