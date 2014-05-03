class Leader
  attr_accessor :winner, :loser, :percentage, :font
end

class HomeController < ApplicationController
  def index
    @font_1 = Font.first(:offset => rand(Font.count))
    @font_2 = @font_1
    
    # ensure no two fonts shown at same time
    while @font_2 == @font_1 do
      @font_2 = Font.first(:offset => rand(Font.count))
    end
  end
    
  def leaderboard
    @fonts = Font.all
    @leader_array = Array.new 
    
    @fonts.each do |font|
      leader = Leader.new
      leader.winner = Vote.where(winner: font.id).count
      leader.loser = Vote.where(loser: font.id).count
      leader.font = font
      
      leader.percentage = '%.0f' % (100 *(leader.winner.to_f / (leader.loser + leader.winner)))
      @leader_array << leader
    end
    
    
    @leader_array.sort!{|a,b| b.winner <=> a.winner}
    
    return @leader_array
  end
end