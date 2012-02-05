class HomeController < ApplicationController
  protect_from_forgery

  def index
    @texts  = Text.all(:joins  => :contents,
                                  :order => 'created_at DESC',
                                  :conditions => ["texts.publish = true AND texts.firstpage = true"],
                                  :limit => 20)

    @latests  = Text.all(:joins  => :contents,
                                  :order => 'created_at DESC',
                                  :conditions => ["texts.publish = true AND texts.firstpage = true"],
                                  :limit => 30)

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @texts }
    end
  end
end
