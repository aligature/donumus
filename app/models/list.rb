class List < ActiveRecord::Base
   has_many :list_users, :class_name => 'ListUser'
   has_many :users, through: :list_users
   has_many :gifts

   def save_as_view(session)
      session[:view_list_id] = id
   end

   def self.view_list(session)
      return find(session[:view_list_id])
   end
end
