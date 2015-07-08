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
    results = WithGameSummaries::SearchAndPaginate.call(params:        params,
                                                        initial_scope: @bgg_mechanic.game_summaries,
                                                        init_search: { game_summary_mechanics_bgg_mechanic_id_in_all: [@bgg_mechanic.id]}
    )

    @q              = results.q
    @game_summaries = results.game_summaries

  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_bgg_mechanic
    @bgg_mechanic = BggMechanic.friendly.find(params[:id]).decorate
  end
end
