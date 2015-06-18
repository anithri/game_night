class BggCategoriesController < ApplicationController
  before_action :set_bgg_category, only: [:show, :edit, :update, :destroy]

  # GET /bgg_categories
  # GET /bgg_categories.json
  def index
    @bgg_categories = BggCategory.order(:name).all
  end

  # GET /bgg_categories/1
  # GET /bgg_categories/1.json
  def show
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_bgg_category
      @bgg_category = BggCategory.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def bgg_category_params
      params[:bgg_category]
    end
end
