class FontsController < ApplicationController
  
  protect_from_forgery except: :index
  
  respond_to :html, :xml, :json
  
  def new
    @font = Font.new()
  end
  
  def create
    @font = Font.new(font_params)
  
    if @font.save
      redirect_to @font
    else
      render 'new'
    end
  end
    
  def show
    @font = Font.find(params[:id])
  end
  
  #increment votes variable for given Font
  def vote
    @font1 = Font.find(params[:id1])
    @font2 = Font.find(params[:id2])
    
    @font1.increment!(:votes)
    
    @vote = Vote.new()
    @vote.winner = params[:id1]
    @vote.loser = params[:id2]
    @vote.created_at = Time.now
    @vote.updated_at = Time.now
    @vote.save
    
    @count1, @count2, @percentage1, @percentage2 = count_votes
    
    Rails.logger.debug("My object: #{@percentage1.inspect}")
    Rails.logger.debug("My object: #{@percentage2.inspect}")
    
    respond_to do |format|
      format.js {}
    end
  end
  
  def index
    @fonts = Font.all
  end
  
  def leaderboard
    @votes = Vote.all
  end
  
  def edit
    @font = Font.find(params[:id])
  end
  
  def update
    @font = Font.find(params[:id])
    if @font.update(params[:font].permit(:name,:title,:link,:source,:style))
      redirect_to @font
    else
      render 'edit'
    end
  end
  
  def destroy
    @font = Font.find(params[:id])
    
    @font.destroy
    redirect_to fonts_path
  end

  private
    def font_params
      params.fetch(:font,{}).permit(:name,:title,:link,:source,:style,:votes)
    end
    
    def count_votes()
      @count1 = Vote.where(winner: params[:id1]).count
      @count2 = Vote.where(winner: params[:id2]).count
      
      @percentage1 = '%.0f' % (100 * @count1.to_f / (@count1+@count2))
      @percentage2 = '%.0f' % (100 * @count2.to_f / (@count1+@count2))
      
      return @count1,@count2,@percentage1,@percentage2      
    end
  
end
