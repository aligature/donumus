class Status < ActiveRecord::Base
   belongs_to :gift
   belongs_to :added_by_user, class_name: "User",
                              foreign_key: "added_by_user_id"

   enum status: { available: 0, looking: 10, partially_gone: 20, gone: 30}

   def self.summary(statuses)
      statuses = statuses.sort_by {|status| self.statuses[status.status]}
      statuses.empty? ? "" : statuses.last.status
   end

   def to_s
      "%s %s" % [self.id, self.status]
   end
end
