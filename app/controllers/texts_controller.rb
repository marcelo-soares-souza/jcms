class TextsController < ApplicationController
  before_filter :authenticate_user!, :only => [:new, :edit, :create, :update, :destroy]
  protect_from_forgery

  # GET /texts
  # GET /texts.json
  def index
    @licenses = License.all
    @text = Text.new
    @all = Text.all(:joins  => :owners, :order => "created_at DESC", :conditions => ["texts.publish = true"])

    if user_signed_in?
      @my = Text.all(:joins => :owners, :order => "created_at DESC", :conditions => ["owners.user_id = #{current_user.id}" ])
    end

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @all }
    end
  end

  # GET /texts/1
  # GET /texts/1.json
  def show
    @text = Text.find(params[:id].downcase)

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @text }
    end
  end

  # GET /texts/new
  # GET /texts/new.json
  def new
    @licenses = License.all
    @text = Text.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @text }
    end
  end

  # GET /texts/1/edit
  def edit
    @licenses = License.all
    @all = Text.all(:joins  => :owners, :conditions => ["texts.publish = true"])

    if user_signed_in?
      @my = Text.all(:joins => :owners, :conditions => ["owners.user_id = #{current_user.id}" ])
    end

    @text = Text.find(params[:id].downcase)
  end

  # POST /texts
  # POST /texts.json
  def create
    @licenses = License.all
    @text = Text.new(params[:text])

    respond_to do |format|
      if @text.save
        format.html { redirect_to texts_url, :notice => 'Successfully created' }
        format.json { render :json => @text, :status => :created, :location => @text }
      else
        format.html { render :action => "new" }
        format.json { render :json => @text.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /texts/1
  # PUT /texts/1.json
  def update
    @texts = Text.all
    @text = Text.find(params[:id].downcase)

    respond_to do |format|
      if @text.update_attributes(params[:text])
        format.html { redirect_to texts_url, :notice => 'Successfully updated' }
        format.json { head :no_content }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @text.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /texts/1
  # DELETE /texts/1.json
  def destroy
    @text = Text.find(params[:id].downcase)
    @text.destroy

    respond_to do |format|
      format.html { redirect_to texts_url, :notice => 'Successfully deleted' }

      format.json { head :no_content }
    end
  end

  def rss
    @texts = Text.find(:all, :order => "id DESC", :limit => 10)
    render :layout => false
    response.headers["Content-Type"] = "application/xml; charset=utf-8"
  end

  def search
    @all = Text.search do
      keywords params[:query]
    end.results

    respond_to do |format|
      format.html { render :action => "index" }
      format.xml  { render :xml => @texts }
    end
  end
end
