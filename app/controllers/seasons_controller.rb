class SeasonsController < ApplicationController
    before_action :set_season, only: [:show, :edit, :update, :destroy]
    before_action :authenticate_user!, only:  [:new, :edit, :create, :update, :destroy]

    # GET /seasons
    # GET /seasons.json
    def index
        @seasons = Season.all
    end

    # GET /seasons/1
    # GET /seasons/1.json
    def show
    end

    # GET /seasons/new
    def new
        @season = Season.new
        @season.series = Series.find(params[:series])
    end

    # GET /seasons/1/edit
    def edit
    end

    # POST /seasons
    # POST /seasons.json
    def create
        @season = Season.new(season_params.except(:series))
        @series = Series.find(season_params[:series])
        @season.series = @series
        respond_to do |format|
            if @season.save
                format.html { redirect_to @season, notice: 'Season was successfully created.' }
                format.json { render :show, status: :created, location: @season }
            else
                format.html { render :new }
                format.json { render json: @season.errors, status: :unprocessable_entity }
            end
        end
    end

    # PATCH/PUT /seasons/1
    # PATCH/PUT /seasons/1.json
    def update
        respond_to do |format|
            if @season.update(season_params.except(:series))
                format.html { redirect_to @season, notice: 'Season was successfully updated.' }
                format.json { render :show, status: :ok, location: @season }
            else
                format.html { render :edit }
                format.json { render json: @season.errors, status: :unprocessable_entity }
            end
        end
    end

    # DELETE /seasons/1
    # DELETE /seasons/1.json
    def destroy
        @season.destroy
        if params[:from] == 'series'
            redirect_to series_path(params[:series_id])
        else
            respond_to do |format|
                format.html { redirect_to seasons_url, notice: 'Season was successfully destroyed.' }
                format.json { head :no_content }
            end
        end
    end

    private

    # Use callbacks to share common setup or constraints between actions.
    def set_season
        @season = Season.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def season_params
        params.require(:season).permit(:number, :cover, :series)
    end
end
