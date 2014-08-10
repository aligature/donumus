class UserNote < ActiveRecord::Base
   belongs_to :user

   def to_s
      self.notes
   end

end
