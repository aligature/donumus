class UserNote < ActiveRecord::Base

   belongs_to :user

   def to_s
      self.notes
   end

   def check_permissions(user)
      return self.user.check_permissions(user)
   end

end
