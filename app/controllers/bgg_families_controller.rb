class BggFamiliesController < ApplicationController
  before_action :set_bgg_family, only: [:show, :edit, :update, :destroy]

  # GET /bgg_families
  # GET /bgg_families.json
  def index
    @bgg_families = BggFamily.includes(:game_summaries).order(:name).all
  end

  # GET /bgg_families/1
  # GET /bgg_families/1.json
  def show
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_bgg_family
      @bgg_family = BggFamily.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def bgg_family_params
      params[:bgg_family]
    end
end
