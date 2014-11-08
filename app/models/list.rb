class List < ActiveRecord::Base

   has_many :list_users, :class_name => 'ListUser'
   has_many :users, through: :list_users
   has_many :families, -> { distinct }, through: :users
   has_many :gifts, dependent: :destroy

   def save_as_view(session)
      session[:view_list_id] = id
   end

   def self.view_list(session)
      return find(session[:view_list_id])
   end

   def check_permissions(user)
      families.each do |family|
         if family.check_permissions(user)
            return true
         end
      end
      return false
   end

   def set_last_changed
      touch :last_change_time
      users.each do |user|
         user.set_last_changed
      end
   end

   def updated?(user)
      if last_change_time and user.last_session_time
         last_change_time > user.last_session_time
      else
         false
      end
   end

end
