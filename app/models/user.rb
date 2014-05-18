class User < ActiveRecord::Base
   has_many :list_users, :class_name => 'ListUser'
   has_many :lists, through: :list_users
   has_many :family_users, :class_name => 'FamilyUser'
   has_many :families, through: :family_users

   def save_as_login(session)
      session[:login_user_id] = id()
   end

   def self.login_user(session)
      return find(session[:login_user_id])
   end

   def save_as_view(session)
      session[:view_user_id] = id()
   end

   def self.view_user(session)
      return find(session[:view_user_id])
   end
end
