class ListUser < ActiveRecord::Base
   belongs_to :list
   belongs_to :user

   # Ransack configuration for ActiveAdmin
   def self.ransackable_associations(auth_object = nil)
      ["list", "user"]
   end

   def self.ransackable_attributes(auth_object = nil)
      ["list_id", "user_id", "created_at", "updated_at"]
   end
end
