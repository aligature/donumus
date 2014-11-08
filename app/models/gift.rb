class Gift < ActiveRecord::Base
   belongs_to :list
   has_many :statuses, dependent: :destroy

   scope :visible, -> (hide_things) { where :hidden != hide_things or !hide_things }

   validates :description, presence: true
   validates :link, url: true 

   def status_summary
      Status.summary(self.statuses)
   end

   def to_s
      "%d: %s" % [self.id, self.description]
   end

   def check_permissions(user)
      return list.check_permissions(user)
   end

end
