class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :rememberable, :trackable, :omniauthable
     #:database_authenticatable, :registerable, :recoverable, :validatable,


   #attr_accessible :email, :provider, :uid

   has_many :list_users, :class_name => 'ListUser'
   has_many :lists, through: :list_users
   has_many :family_users, :class_name => 'FamilyUser'
   has_many :families, through: :family_users
   has_one :user_note
   has_many :addresses
   has_many :emails
   has_many :phone_numbers

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

   def display_name
      "#{name} (#{username})"
   end

   def email_required?
      false
   end

   def email_changed?
      false
   end

   def password_required?
      false
   end

   def password_match?
      true
   end
end
