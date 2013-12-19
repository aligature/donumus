class Gift < ActiveRecord::Base
   #validates :description, presence: true, length: { minimum: 5 }
   validates :description, presence: true
   validates :link, url: true 
end
