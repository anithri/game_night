class BggMechanicsController < ApplicationController
  before_action :set_bgg_mechanic, only: [:show, :edit, :update, :destroy]

  # GET /bgg_mechanics
  # GET /bgg_mechanics.json
  def index
    @bgg_mechanics = BggMechanic.order(:name).all
  end

  # GET /bgg_mechanics/1
  # GET /bgg_mechanics/1.json
  def show
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_bgg_mechanic
      @bgg_mechanic = BggMechanic.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def bgg_mechanic_params
      params[:bgg_mechanic]
    end
end
