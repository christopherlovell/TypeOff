class HomeController < ApplicationController
  def index
    @font_1 = Font.first(:offset => rand(Font.count))
    @font_2 = @font_1
    
    # ensure no two fonts shown at same time
    while @font_2 == @font_1 do
      @font_2 = Font.first(:offset => rand(Font.count))
    end
  end
    
  #def leaderboard
   # @votes = Vote.all
    
   # # create a vote hash with font ID as the key
   # @count = hash.new()
    
  #  @font.each do |font|
  #    @count[vote.winner] = Vote.where(winner: params[:]).count
  #  end
    
    
    
  #end
end