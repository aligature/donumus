class Gift < ActiveRecord::Base
   include LastChanged

   belongs_to :list
   has_many :statuses, dependent: :destroy

   scope :visible, -> (hide_things) { where :hidden != hide_things or !hide_things }

   validates :description, presence: true
   validates :link, url: true 

   after_save :set_last_changed

   def status_summary
      Status.summary(self.statuses)
   end

   def to_s
      "%d: %s" % [self.id, self.description]
   end

   def check_permissions(user)
      return list.check_permissions(user)
   end

   def set_last_changed
      touch :last_change_time
      list.set_last_changed
   end

   def added_status
      return Status.new(:added_by_user_id => self.added_by_user_id, :gift_id => self.id,
                        :note => "gift created", :status => :available,
                        :created_at => self.created_at, :updated_at => self.created_at)
   end

   # Ransack configuration for ActiveAdmin
   def self.ransackable_associations(auth_object = nil)
      ["list", "statuses"]
   end

   def self.ransackable_attributes(auth_object = nil)
      ["description", "link", "list_id", "added_by_user_id", "starred", "hidden", "created_at", "updated_at", "last_change_time"]
   end

end
