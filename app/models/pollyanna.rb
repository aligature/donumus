class Pollyanna < ActiveRecord::Base

   belongs_to :giver, :class_name => "User"
   belongs_to :receiver, :class_name => "User"

   def to_s
      self.created_at.year
   end

end
