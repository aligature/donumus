class Gift < ActiveRecord::Base
   belongs_to :list
   #validates :description, presence: true, length: { minimum: 5 }
   validates :description, presence: true
   validates :link, url: true 
end
