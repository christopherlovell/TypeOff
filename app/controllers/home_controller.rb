class HomeController < ApplicationController
  def index
    @font_1 = Font.first(:offset => rand(Font.count))
    @font_2 = Font.first(:offset => rand(Font.count))
  end
  
  def leaderboard
    @fonts = Font.all    
  end

end
