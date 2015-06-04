class Family < ActiveRecord::Base
   include LastChanged

   has_many :family_users, :class_name => 'FamilyUser'
   has_many :visible_family_users, -> { where hidden: true }, :class_name => 'FamilyUser'
   has_many :users, through: :visible_family_users

   #has_many :event_users
   #has_many :active_event_users, -> { where active: true }, class_name: 'EventUser'
   #has_many :active_events, :through => :active_event_users, class_name: 'Event', :source => :event

   #has_many :admins, :through => :company_memberships, :class_name => :user, :conditions => {:admin => true}

   def save_as_view(session)
      session[:view_family_id] = id
   end

   def self.view_family(session)
      return find(session[:view_family_id])
   end

   def check_permissions(user)
      if users.exclude? user
         return false
      end
      return true
   end

   def set_last_changed
      touch :last_change_time
   end

end
