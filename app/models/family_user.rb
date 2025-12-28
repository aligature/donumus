class FamilyUser < ActiveRecord::Base
   belongs_to :family
   belongs_to :user

   # Ransack configuration for ActiveAdmin
   def self.ransackable_associations(auth_object = nil)
      ["family", "user"]
   end

   def self.ransackable_attributes(auth_object = nil)
      ["family_id", "user_id", "created_at", "updated_at"]
   end
end
