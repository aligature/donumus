class Email < ActiveRecord::Base
   belongs_to :user

   def to_s
      self.email
   end

   # Ransack configuration for ActiveAdmin
   def self.ransackable_associations(auth_object = nil)
      ["user"]
   end

   def self.ransackable_attributes(auth_object = nil)
      ["email", "label", "user_id", "created_at", "updated_at"]
   end
end
