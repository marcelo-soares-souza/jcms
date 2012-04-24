class RestController < ApplicationController
  before_filter :authenticate_user!
  respond_to :json
  before_filter :menu

  def menu
    @mainmenu = Menu.all
  end

  def texts
    @texts = Text.all

    respond_with(@texts)
 end

end
