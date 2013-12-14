class Font < ActiveRecord::Base
  validates :title, presence: true, length: { minimum: 5 }
  validates :linktitle, presence: true, length: { minimum: 5 }
  validates :link, presence: true, length: { minimum: 5 }
  
end
