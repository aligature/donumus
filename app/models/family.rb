class Family < ActiveRecord::Base
   has_many :family_users, :class_name => 'FamilyUser'
   has_many :users, through: :family_users
end
