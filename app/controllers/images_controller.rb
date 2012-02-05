class ImagesController < ApplicationController
  before_filter :authenticate_user!, :only => [:new, :edit, :create, :update, :destroy]
  protect_from_forgery

  # GET /images
  # GET /images.json
  def index
    @image = Image.new
    @licenses = License.all
    @all = Image.all(:joins  => :contents, :conditions => ["images.publish = true"])

    if user_signed_in?
      @my = Image.all(:joins => :contents, :conditions => ["contents.user_id = #{current_user.id}" ])
    end

    respond_to do |format|
      format.html # index.html.erb
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
    @all = Image.all(:joins  => :contents, :conditions => ["images.publish = true"])

    if user_signed_in?
      @my = Image.all(:joins => :contents, :conditions => ["contents.user_id = #{current_user.id}" ])
    end

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
    @images = Image.all
    @image = Image.find(params[:id])

    respond_to do |format|
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
    @image.destroy

    respond_to do |format|
      format.html { redirect_to images_url, :notice => 'Successfully deleted' }

      format.json { head :no_content }
    end
  end
end
