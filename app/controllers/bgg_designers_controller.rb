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
    results = WithGameSummaries::SearchAndPaginate.call(params:        params,
                                                        initial_scope: @bgg_designer.game_summaries,
                                                        init_search: { game_summary_designers_bgg_designer_id_in_all: [@bgg_designer.id]}

    )

    @q              = results.q
    @game_summaries = results.game_summaries

  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_bgg_designer
    @bgg_designer = BggDesigner.friendly.find(params[:id]).decorate
  end
end
