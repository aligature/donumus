class ApplicationController < ActionController::Base
   # Prevent CSRF attacks by raising an exception.
   # For APIs, you may want to use :null_session instead.
   protect_from_forgery with: :exception

   before_filter :check_session_times
   before_filter :default_views

   SessionTimeout = 60 * 60
   #SessionTimeout = 10

   def check_session_times
      if current_user
         now = Time.now

         # if enough time has gone by count it as a new session
         if not current_user.current_session_time? or now - current_user.current_session_time > SessionTimeout
            current_user.update_columns last_session_time: current_user.current_session_time, current_session_time: now
         else
            current_user.update_columns current_session_time: now
         end

      end
   end

   def default_views
      @view_user = User.view_user(session)
      @view_family = Family.view_family(session, current_user)
   end

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

   def maybe_redirect(ok = nil)
      if !ok
         redirect_to root_path
      end
   end

end
