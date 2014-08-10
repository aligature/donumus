class Email < ActiveRecord::Base
   belongs_to :user

   def to_s
      self.email
   end
end
