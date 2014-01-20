class FontsController < ApplicationController
  
  protect_from_forgery except: :index
  
  def new
    @font = Font.new
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
    
    @font = Font.find(params[:id])
    
    @font.increment!(:votes)
    
    respond_to do |format|
      format.js {render :json => params[:id]}
    end
      
    
    #respond_to do |format|
      #format.html
      #format.js
    #end
  end
  
  def index
    @fonts = Font.all
  end
  
  def leaderboard
    @fonts = Font.all
  end
  
  def edit
    @font = Font.find(params[:id])
  end
  
  def update
    @font = Font.find(params[:id])
    if @font.update(params[:font].permit(:title,:linktitle,:link))
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
      params.require(:font).permit(:title, :linktitle, :link, :votes)
    end
  
end
