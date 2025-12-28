class PhoneNumber < ActiveRecord::Base
   belongs_to :user
   
   def to_s
      ActionController::Base.helpers.number_to_phone(self.phone_number, area_code: true)
   end

   # Ransack configuration for ActiveAdmin
   def self.ransackable_associations(auth_object = nil)
      ["user"]
   end

   def self.ransackable_attributes(auth_object = nil)
      ["phone_number", "label", "user_id", "created_at", "updated_at"]
   end

end
