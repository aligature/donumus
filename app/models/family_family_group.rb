class FamilyFamilyGroup < ActiveRecord::Base
   belongs_to :family
   belongs_to :family_group
end
