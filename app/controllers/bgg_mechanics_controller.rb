class BggMechanicsController < ApplicationController
  before_action :set_bgg_mechanic, only: [:show, :edit, :update, :destroy]

  # GET /bgg_mechanics
  # GET /bgg_mechanics.json
  def index
    q_param = params[:q] || {}
    page = params[:page]
    per_page = params[:per_page]
    @q = policy_scope(BggMechanic).ransack q_param
    @q.sorts = 'name asc' if @q.sorts.empty?
    @bgg_mechanics = @q.result(distinct: true).page(page).per(per_page).decorate
  end

  # GET /bgg_mechanics/1
  # GET /bgg_mechanics/1.json
  def show
    authorize @bgg_mechanic
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_bgg_mechanic
    @bgg_mechanic = BggMechanic.find(params[:id]).decorate
  end
end
