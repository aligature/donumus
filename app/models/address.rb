class Address < ActiveRecord::Base
   belongs_to :user

   def to_s
      self.address
   end

   # Ransack configuration for ActiveAdmin
   def self.ransackable_associations(auth_object = nil)
      ["user"]
   end

   def self.ransackable_attributes(auth_object = nil)
      ["address", "label", "user_id", "created_at", "updated_at"]
   end

end
