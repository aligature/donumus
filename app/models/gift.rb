class Gift < ActiveRecord::Base
   belongs_to :list
   has_many :statuses

   #validates :description, presence: true, length: { minimum: 5 }
   validates :description, presence: true
   validates :link, url: true 

   def status_summary
      Status.summary(self.statuses)
   end

   def to_s
      "%d: %s" % [self.id, self.description]
   end

end
