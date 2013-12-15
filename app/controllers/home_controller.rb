class HomeController < ApplicationController
  def index
    @font = Font.first(:offset => rand(Font.count))
  end
end
