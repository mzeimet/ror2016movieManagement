class VideosController < ApplicationController
  before_action :set_video, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, only:  [:new, :edit, :create, :update, :destroy]
  # GET /videos
  # GET /videos.json
  def index
    @videos = Video.all
  end

  # GET /videos/1
  # GET /videos/1.json
  def show
  end

  # GET /videos/new
  def new
    @video = Video.new
    @video.build_location
    @video.location.platforms.build
  end

  # GET /videos/1/edit
  def edit
  end

  # POST /videos
  # POST /videos.json
  def create
    @video = Video.new(video_params.except(:actors).except(:genres).except(:regisseurs))
    @actors = Actor.where(:id => video_params[:actors])
    @genres = Genre.where(:id => video_params[:genres])
    @regisseurs = Regisseur.where(:id => video_params[:regisseurs])
    @video.actors << @actors
    @video.genres << @genres
    @video.regisseurs << @regisseurs
    respond_to do |format|
      if @video.save
        format.html { redirect_to @video}
        format.json { render :show, status: :created, location: @video }
      else
        format.html { render :new }
        format.json { render json: @video.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /videos/1
  # PATCH/PUT /videos/1.json
  def update
    respond_to do |format|
      @actors = Actor.where(:id => video_params[:actors])
      @video.actors.destroy_all
      @video.actors << @actors
      @genres = Genre.where(:id => video_params[:genres])
      @video.genres.destroy_all
      @video.genres << @genres
      @regisseurs = Regisseur.where(:id => video_params[:regisseurs])
      @video.regisseurs.destroy_all
      @video.regisseurs << @regisseurs
      if @video.update(video_params.except(:actors).except(:genres).except(:regisseurs))
        format.html { redirect_to @video}
        format.json { render :show, status: :ok, location: @video }
      else
        format.html { render :edit }
        format.json { render json: @video.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /videos/1
  # DELETE /videos/1.json
  def destroy
    @video.destroy
    respond_to do |format|
      format.html { redirect_to videos_url}
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_video
      @video = Video.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def video_params
      params.require(:video).permit(:videoType, :name, :seen, :length, :cover, :release, :raiting, :summary, :ageRating, :note, :actors =>[], :genres =>[], :regisseurs =>[], location_attributes: [:description, :id, platforms_attributes: [:name, :borrowed, :borrowedDate, :id]])
    end
end
