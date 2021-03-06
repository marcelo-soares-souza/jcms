class HomeController < ApplicationController
  protect_from_forgery
  before_filter :menu

  def menu        
    @mainmenu = Menu.all
  end

  def index
    @tags = Text.tag_counts_on(:tags)

    @latests  = Text.all(:joins  => :owners,
                                    :order => 'created_at DESC',
                                    :conditions => ["texts.publish = true AND texts.firstpage = true"],
                                    :limit => 30)

    @texts = Text.order('created_at DESC').where("texts.publish = true AND texts.firstpage = true").page params[:page]

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @texts }
    end
  end

  def search
    @latests  = Text.all(:joins  => :owners,
                                    :order => 'created_at DESC',
                                    :conditions => ["texts.publish = true AND texts.firstpage = true"],
                                    :limit => 30)

    @texts = Text.search do
      keywords params[:query]
      paginate :page => params[:page], :per_page => 15
      order_by :created_at, :desc
    end.results

    respond_to do |format|
      format.html { render :action => "index" }
      format.json { render :json => @texts }
      format.xml  { render :xml => @texts }
    end
  end

  def tagged
    if params[:tag].present?
      @texts  = Text.tagged_with(params[:tag]).sort_by(&:id).reverse
      @images = Image.tagged_with(params[:tag]).sort_by(&:id).reverse
    else
      @texts = Text.all
      @images = Image.all
    end
  end
end
