class FontsController < ApplicationController
  
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
  
  def vote
    @font = Font.find(params[:id])
    
    @font.update_attribute("votes",votes+1)    
    
    respond_to do |format|
      format.html
      format.js
    end
  end
  
  def index
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
