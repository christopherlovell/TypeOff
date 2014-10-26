class Font < ActiveRecord::Base  
  validates :title, presence: true, length: { minimum: 5 }
  validates :name, presence: true, length: { minimum: 5 }
  validates :link, presence: true, length: { minimum: 5 }
  validates :source, presence: true, length: { minimum: 5 }
  validates :style, presence: true, length: { minimum: 5 }
  
  #set default value for votes variable
  before_save :default_values
  def default_values
    self.votes ||= '0'
  end
  
end
