class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def new_session_path(scope)
     new_user_session_path
  end

  def authenticate_admin_user!
     raise SecurityError unless current_user and current_user.administrator?
     #authenticate_user! 
     #unless current_user.admin?
        #flash[:alert] = "This area is restricted to administrators only."
        #redirect_to root_path 
     #end
  end

  def current_admin_user
     return nil if user_signed_in? && !current_user.admin?
     current_user
  end

end
