class PlatformsController < ApplicationController
  before_action :set_platform, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, only:  [:new, :edit, :create, :update, :destroy]

  # GET /platforms
  # GET /platforms.json
  def index
    if (params.has_key?(:pname))
      @pname = params[:pname]
      @platforms = Platform.where(:name => @pname)
      render 'index_specific'
    else
    @platforms = platform_index
      render 'index'
    end
  end

  # GET /platforms/1
  # GET /platforms/1.json
  def show
  end

  # GET /platforms/new
  def new
    @platform = Platform.new
  end

  # GET /platforms/1/edit
  def edit
  end

  # POST /platforms
  # POST /platforms.json
  def create
    @platform = Platform.new(platform_params)

    respond_to do |format|
      if @platform.save
        format.html { redirect_to @platform, notice: 'Platform was successfully created.' }
        format.json { render :show, status: :created, location: @platform }
      else
        format.html { render :new }
        format.json { render json: @platform.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /platforms/1
  # PATCH/PUT /platforms/1.json
  def update
    respond_to do |format|
      if @platform.update(platform_params)
        format.html { redirect_to @platform, notice: 'Platform was successfully updated.' }
        format.json { render :show, status: :ok, location: @platform }
      else
        format.html { render :edit }
        format.json { render json: @platform.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /platforms/1
  # DELETE /platforms/1.json
  def destroy
    @platform.destroy
    respond_to do |format|
      format.html { redirect_to platforms_url, notice: 'Platform was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_platform
      @platform = Platform.find(params[:id])
    end

    def platform_index
    #  platforms = Array.new(9,Hash.new)
    return [{name: "Amazon" },{name: "Flickr"},{name: "Hulu"},{name: "Maxdome"},{name: "Netflix"},
      {name: "Stream general"},{name: "Vimeo"},{name: "Watchever"},{name: "Youtube"}]
    end


    # Never trust parameters from the scary internet, only allow the white list through.
    def platform_params
      params.require(:platform).permit(:name, :borrowed, :borrowedDate)
    end
end
