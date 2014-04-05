class User < ActiveRecord::Base
   has_many :list_users, :class_name => 'ListUser'
   has_many :lists, through: :list_users
   has_many :family_users, :class_name => 'FamilyUser'
   has_many :families, through: :family_users
end
