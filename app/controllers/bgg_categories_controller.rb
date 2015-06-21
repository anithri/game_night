class BggCategoriesController < ApplicationController
  before_action :set_bgg_category, only: [:show, :edit, :update, :destroy]

  # GET /bgg_categories
  # GET /bgg_categories.json
  def index
    q_param = params[:q] || {}
    page = params[:page]
    per_page = params[:per_page]
    @q = BggCategory.ransack q_param
    @q.sorts = 'name asc' if @q.sorts.empty?
    @bgg_categories = @q.result(distinct: true).page(page).per(per_page).decorate
  end

  # GET /bgg_categories/1
  # GET /bgg_categories/1.json
  def show
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_bgg_category
    @bgg_category = BggCategory.find(params[:id]).decorate
  end
end
