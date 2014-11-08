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

end
