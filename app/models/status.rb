class Status < ActiveRecord::Base

   belongs_to :gift
   belongs_to :added_by_user, class_name: "User",
                              foreign_key: "added_by_user_id"

   after_save :set_last_changed
   before_destroy :set_last_changed

   validates :status, presence: true

   enum status: { available: 0, looking: 10, partially_gone: 20, gone: 30 }

   def self.summary(statuses)
      statuses = statuses.sort_by {|status| self.statuses[status.status]}
      statuses.empty? ? nil : statuses.last
   end

   def self.label(status, include_available = false)
      labels = { "available" => include_available ? "available" : "", "looking" => "looking", "partially_gone" => "partial", "gone" => "gone"}
      return labels[status]
   end

   def self.form_statuses
      return statuses.drop(1)
   end

   def to_s
      "%s %s" % [self.id, self.status]
   end

   def check_permissions(user)
      return gift.check_permissions(user)
   end

   def set_last_changed
      gift.set_last_changed
   end

   # Ransack configuration for ActiveAdmin
   def self.ransackable_associations(auth_object = nil)
      ["gift", "added_by_user"]
   end

   def self.ransackable_attributes(auth_object = nil)
      ["gift_id", "added_by_user_id", "status", "note", "created_at", "updated_at"]
   end

end
