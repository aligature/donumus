class List < ActiveRecord::Base
   has_many :list_users, :class_name => 'ListUser'
   has_many :users, through: :list_users
   has_many :gifts
end
