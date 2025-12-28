class Family < ActiveRecord::Base
   include LastChanged

   has_many :family_users, :class_name => 'FamilyUser'
   has_many :users, through: :family_users

   def save_as_view(session)
      session[:view_family_id] = id
   end

   def self.view_family(session, user = nil)
      if not session[:view_family_id]
         if not user
            return nil
         end
         return user.families()[0]
      end
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

   # Ransack configuration for ActiveAdmin
   def self.ransackable_associations(auth_object = nil)
      ["family_users", "users"]
   end

   def self.ransackable_attributes(auth_object = nil)
      ["name", "created_at", "updated_at", "last_change_time"]
   end

end
