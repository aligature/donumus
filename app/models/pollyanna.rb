class Pollyanna < ActiveRecord::Base

   belongs_to :giver, :class_name => "User"
   belongs_to :receiver, :class_name => "User"

   def to_s
      self.created_at.year
   end

   # Ransack configuration for ActiveAdmin
   def self.ransackable_associations(auth_object = nil)
      ["giver", "receiver"]
   end

   def self.ransackable_attributes(auth_object = nil)
      ["giver_id", "receiver_id", "name", "created_at", "updated_at"]
   end

end
