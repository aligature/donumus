class Family < ActiveRecord::Base
   has_many :family_users, :class_name => 'FamilyUser'
   has_many :users, through: :family_users

   def save_as_view(session)
      session[:view_family_id] = id
   end

   def self.view_family(session)
      return find(session[:view_family_id])
   end

   def check_permissions(user)
      if users.exclude? user
         return false
      end
      return true
   end

   def set_last_changed
      touch :last_change_time
   end

   def updated?(user)
      if last_change_time and user.last_session_time
         last_change_time > user.last_session_time
      else
         false
      end
   end

end
