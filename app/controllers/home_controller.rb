class HomeController < ApplicationController
  def index
    @texts = Text.all
    @images = Image.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @texts }
    end
  end
end
