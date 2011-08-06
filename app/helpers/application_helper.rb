module ApplicationHelper
  def current_sc_user
    @current_sc_user
  end
  
  def logged_in?
    !!current_sc_user
  end
end
