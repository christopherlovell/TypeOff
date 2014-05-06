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
    
<<<<<<< HEAD
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
=======
  #def leaderboard
   # @votes = Vote.all
    
   # # create a vote hash with font ID as the key
   # @count = hash.new()
    
  #  @font.each do |font|
  #    @count[vote.winner] = Vote.where(winner: params[:]).count
  #  end
>>>>>>> 1c86a4066d5b3c0188b1e04f73c483447876da61
    
    
    @leader_array.sort!{|a,b| b.winner <=> a.winner}
    
<<<<<<< HEAD
    return @leader_array
  end
=======
  #end
>>>>>>> 1c86a4066d5b3c0188b1e04f73c483447876da61
end