module LastChanged
   extend ActiveSupport::Concern

   def updated?(user)
      if last_change_time and user.last_session_time
         last_change_time > user.last_session_time
      elsif not user.last_session_time
         true
      else
         false
      end
   end

end
