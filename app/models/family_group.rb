class FamilyGroup < ActiveRecord::Base

   has_many :family_group_users, :class_name => 'FamilyGroupUser'
   has_many :users, through: :family_group_users

end
