class HomeController < ApplicationController
  def index
    @font_1 = Font.first(:offset => rand(Font.count))
    @font_2 = @font_1
    
    while @font_2 == @font_1 do
      @font_2 = Font.first(:offset => rand(Font.count))
    end
  end
  
  def leaderboard
    @fonts = Font.all    
  end

end
