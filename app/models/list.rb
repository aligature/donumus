class List < ActiveRecord::Base
   include LastChanged

   has_many :list_users, :class_name => 'ListUser'
   has_many :users, through: :list_users
   has_many :families, -> { distinct }, through: :users
   has_many :gifts, dependent: :destroy

   def save_as_view(session)
      session[:view_list_id] = id
   end

   def self.view_list(session)
      return find(session[:view_list_id])
   end

   def check_permissions(user)
      families.each do |family|
         if family.check_permissions(user)
            return true
         end
      end
      return false
   end

   def set_last_changed
      touch :last_change_time
      users.each do |user|
         user.set_last_changed
      end
   end

   def is_restricted?(user)
      users.include? user or (user.is_restricted? and users.any? { |list_user| list_user.is_restricted? })
   end

   # Ransack configuration for ActiveAdmin
   def self.ransackable_associations(auth_object = nil)
      ["list_users", "users", "families", "gifts"]
   end

   def self.ransackable_attributes(auth_object = nil)
      ["name", "personal", "created_at", "updated_at", "last_change_time"]
   end

end
