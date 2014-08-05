class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :rememberable, :trackable, :validatable, :omniauthable
     #:database_authenticatable, :registerable, :recoverable,


   #attr_accessible :email, :provider, :uid

   has_many :list_users, :class_name => 'ListUser'
   has_many :lists, through: :list_users
   has_many :family_users, :class_name => 'FamilyUser'
   has_many :families, through: :family_users

   def save_as_view(session)
      session[:view_user_id] = id()
   end

   def self.view_user(session)
      return find(session[:view_user_id])
   end

   def self.find_for_google_oauth2(access_token, signed_in_resource=nil)
      data = access_token.info
      user = User.where(:username => data["email"]).first
      return user
   end
end
