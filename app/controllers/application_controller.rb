class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :menu

  def menu
    @mainmenu = Menu.all
  end
end
