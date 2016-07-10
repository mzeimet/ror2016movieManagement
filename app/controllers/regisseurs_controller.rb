class RegisseursController < ApplicationController
    before_action :set_regisseur, only: [:show, :edit, :update, :destroy]
    before_action :authenticate_user!, only:  [:new, :edit, :create, :update, :destroy]

    # GET /regisseurs
    # GET /regisseurs.json
    def index
        @regisseurs = Regisseur.all
    end

    # GET /regisseurs/1
    # GET /regisseurs/1.json
    def show
    end

    # GET /regisseurs/new
    def new
        @regisseur = Regisseur.new
    end

    # GET /regisseurs/1/edit
    def edit
    end

    # POST /regisseurs
    # POST /regisseurs.json
    def create
        @regisseur = Regisseur.new(regisseur_params)

        respond_to do |format|
            if @regisseur.save
                format.html { redirect_to @regisseur, notice: 'Regisseur was successfully created.' }
                format.json { render :show, status: :created, location: @regisseur }
            else
                format.html { render :new }
                format.json { render json: @regisseur.errors, status: :unprocessable_entity }
            end
        end
    end

    # PATCH/PUT /regisseurs/1
    # PATCH/PUT /regisseurs/1.json
    def update
        respond_to do |format|
            if @regisseur.update(regisseur_params)
                format.html { redirect_to @regisseur, notice: 'Regisseur was successfully updated.' }
                format.json { render :show, status: :ok, location: @regisseur }
            else
                format.html { render :edit }
                format.json { render json: @regisseur.errors, status: :unprocessable_entity }
            end
        end
    end

    # DELETE /regisseurs/1
    # DELETE /regisseurs/1.json
    def destroy
        @regisseur.destroy
        respond_to do |format|
            format.html { redirect_to regisseurs_url, notice: 'Regisseur was successfully destroyed.' }
            format.json { head :no_content }
        end
    end

    private

    # Use callbacks to share common setup or constraints between actions.
    def set_regisseur
        @regisseur = Regisseur.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def regisseur_params
        params.require(:regisseur).permit(:name, :cover)
    end
end
