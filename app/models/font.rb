class Font < ActiveRecord::Base  
  validates :title, presence: true, length: { minimum: 5 }
  validates :linktitle, presence: true, length: { minimum: 5 }
  validates :link, presence: true, length: { minimum: 5 }
  
  before_save :default_values
  def default_values
    self.votes ||= '0'
  end
  
end
