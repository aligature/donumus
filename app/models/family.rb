class Family < ActiveRecord::Base
   has_many :family_users, :class_name => 'FamilyUser'
   has_many :users, through: :family_users

   def save_as_view(session)
      session[:view_family_id] = id
   end

   def self.view_family(session)
      return find(session[:view_family_id])
   end
end
