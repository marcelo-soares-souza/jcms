class ImagesController < ApplicationController
  before_filter :authenticate_user!, :only => [:my, :new, :edit, :create, :update, :destroy]
  protect_from_forgery
  before_filter :menu

  def menu
    @mainmenu = Menu.all
  end

  # GET /images
  # GET /images.json
  def index
    if user_signed_in?
      @images = Image.all(:joins => :owners, :order => "created_at DESC", :conditions => ["owners.user_id = #{current_user.id} OR images.publish = true" ])
    else
      @images = Image.all(:joins  => :owners, :order => "created_at DESC", :conditions => ["images.publish = true"])
    end

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @all }
    end
  end

  # GET /images/my
  # GET /images/my.json
  def my
    if user_signed_in?
      @images = Image.all(:joins => :owners, :conditions => ["owners.user_id = #{current_user.id}" ])
    else
      @images = Image.all(:joins  => :owners, :conditions => ["images.publish = true"])
    end

    respond_to do |format|
      format.html # my.html.erb
      format.json { render :json => @all }
    end
  end

  # GET /images/1
  # GET /images/1.json
  def show
    @image = Image.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @image }
    end
  end

  # GET /images/new
  # GET /images/new.json
  def new
    @licenses = License.all
    @image = Image.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @image }
    end
  end

  # GET /images/1/edit
  def edit
    @licenses = License.all

    @image = Image.find(params[:id])
  end

  # POST /images
  # POST /images.json
  def create
    @licenses = License.all
    @image = Image.create(params[:image])

    respond_to do |format|
      if @image.save
        format.html { redirect_to images_url, :notice => 'Successfully created' }
        format.json { render :json => @image, :status => :created, :location => @image }
      else
        format.html { render :action => "new" }
        format.json { render :json => @image.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /images/1
  # PUT /images/1.json
  def update
    @licenses = License.all
    @image = Image.find(params[:id])
    owner = false

    @image.owners.each do |owner|
      if current_user.id == owner.user_id
        owner = true
      end
    end

    respond_to do |format|
      if owner != true
          format.html { redirect_to images_url, :alert => 'Permission Denied' }
      end

      if @image.update_attributes(params[:image])
        format.html { redirect_to images_url, :notice => 'Successfully updated' }
        format.json { head :no_content }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @image.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /images/1
  # DELETE /images/1.json
  def destroy
    @image = Image.find(params[:id])
    owner = false

    @image.owners.each do |owner|
      if current_user.id == owner.user_id
        owner = true
      end
    end

    if owner == true
      @image.destroy
    end

    respond_to do |format|
      if owner != true
          format.html { redirect_to images_url, :alert => 'Permission Denied' }
      end

      format.html { redirect_to images_url, :notice => 'Successfully deleted' }

      format.json { head :no_content }
    end
  end

  def rss
    @images = Image.find(:all, :order => "id DESC", :limit => 10)

    render :layout => false
    response.headers["Content-Type"] = "application/xml; charset=utf-8"
  end

  def search
    @images = Image.search do
      keywords params[:query]
      order_by :created_at, :desc
    end.results

    respond_to do |format|
      format.html { render :action => "index" }
      format.xml  { render :xml => @images }
      format.json { render :json => @images }
    end
  end
end
