class PhoneNumber < ActiveRecord::Base
   belongs_to :user
   
   def to_s
      ActionController::Base.helpers.number_to_phone(self.phone_number, area_code: true)
   end

end
