class FamilyGroupUser < ActiveRecord::Base
   belongs_to :family_group
   belongs_to :user
end
