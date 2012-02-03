class BeyondsController < ApplicationController
  def show
    @beyond = Text.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @beyond }
    end
  end
end
