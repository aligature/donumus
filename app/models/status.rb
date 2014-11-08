class Status < ActiveRecord::Base

   belongs_to :gift
   belongs_to :added_by_user, class_name: "User",
                              foreign_key: "added_by_user_id"

   after_save :set_last_changed
   before_destroy :set_last_changed

   enum(status: { available: 0, looking: 10, partially_gone: 20, gone: 30})

   def self.summary(statuses)
      statuses = statuses.sort_by {|status| self.statuses[status.status]}
      statuses.empty? ? nil : statuses.last
   end

   def self.label(status)
      labels = { "available" => "", "looking" => "looking", "partially_gone" => "partial", "gone" => "gone"}
      return labels[status]
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

end
