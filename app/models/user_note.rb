class UserNote < ActiveRecord::Base

   belongs_to :user

   def to_s
      self.notes
   end

   def check_permissions(user)
      return self.user.check_permissions(user)
   end

   # Ransack configuration for ActiveAdmin
   def self.ransackable_associations(auth_object = nil)
      ["user"]
   end

   def self.ransackable_attributes(auth_object = nil)
      ["notes", "user_id"]
   end

end
