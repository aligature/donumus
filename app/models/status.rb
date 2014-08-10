class Status < ActiveRecord::Base
   belongs_to :gift

   enum status: { gone: 0, looking: 1 }

   def self.summary(statuses)
      "status sum"
   end
end
