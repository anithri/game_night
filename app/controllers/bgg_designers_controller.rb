class BggDesignersController < ApplicationController
  before_action :set_bgg_designer, only: [:show, :edit, :update, :destroy]

  # GET /bgg_designers
  # GET /bgg_designers.json
  def index
    q_param        = params[:q] || {}
    page           = params[:page]
    per_page       = params[:per_page]
    @q             = policy_scope(BggDesigner).ransack q_param
    @q.sorts       = 'name asc' if @q.sorts.empty?
    @bgg_designers = @q.result(distinct: true).page(page).per(per_page).decorate
  end

  # GET /bgg_designers/1
  # GET /bgg_designers/1.json
  def show
    authorize @bgg_designer
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_bgg_designer
    @bgg_designer = BggDesigner.find(params[:id]).decorate
  end
end
