class EpisodesController < ApplicationController
  before_action :set_episode, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, only:  [:new, :edit, :create, :update, :destroy]

  # GET /episodes
  # GET /episodes.json
  def index
    @episodes = Episode.all
  end

  # GET /episodes/1
  # GET /episodes/1.json
  def show
   @video = Video.find(@episode.video.id)
  end

  # GET /episodes/new
  def new
    @episode = Episode.new
    @episode.season = Season.find(params[:season])
    @video = Video.new
    @video.build_location
    @video.location.platforms.build
  end

  # GET /episodes/1/edit
  def edit
     @video= @episode.video
  end

  # POST /episodes
  # POST /episodes.json
  def create
    @episode = Episode.new(episode_params.except(:season))
    @season = Season.find(episode_params[:season])
    @episode.season = @season

    @video = Video.new(video_params.except(:actors).except(:genres).except(:regisseurs))
    @actors = Actor.where(:id => video_params[:actors])
    @genres = Genre.where(:id => video_params[:genres])
    @regisseurs = Regisseur.where(:id => video_params[:regisseurs])

    @video.actors << @actors
    @video.genres << @genres
    @video.regisseurs << @regisseurs
    @video.episodes << @episode
    @episode.video = @video

    @video.save
    @episode.valid?
    @episode.errors.full_messages.inspect
    respond_to do |format|
      if @episode.save

        format.html { redirect_to @episode, notice: 'Episode was successfully created.' }
        format.json { render :show, status: :created, location: @episode }
      else
        format.html { render :new }
        format.json { render json: @episode.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /episodes/1
  # PATCH/PUT /episodes/1.json
  def update
    respond_to do |format|
      if @episode.update(episode_params.except(:season))
        format.html { redirect_to @episode, notice: 'Episode was successfully updated.' }
        format.json { render :show, status: :ok, location: @episode }
      else
        format.html { render :edit }
        format.json { render json: @episode.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /episodes/1
  # DELETE /episodes/1.json
  def destroy
    @episode.destroy
    respond_to do |format|
      if params[:from] == 'season'
        redirect_to season_path(params[:season_id])
      else
      format.html { redirect_to episodes_url, notice: 'Episode was successfully destroyed.' }
      format.json { head :no_content }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_episode
      @episode = Episode.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def episode_params
      params.require(:episode).permit(:episodeNumber, :season)
    end
    def video_params
      params.require(:video).permit(:videoType, :name, :seen, :length, :release, :raiting, :summary, :note, :actors =>[], :regisseurs =>[], location_attributes: [:description, :id, platforms_attributes: [:name, :borrowed, :borrowedDate, :id]])
    end
end
