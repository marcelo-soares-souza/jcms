class HomeController < ApplicationController
  protect_from_forgery

  def index
    @texts  = Text.all(:joins  => :contents, :order => 'created_at DESC', :conditions => ["contents.publish = true AND contents.firstpage = true"])

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @texts }
    end
  end
end
