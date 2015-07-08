class BggFamiliesController < ApplicationController
  before_action :set_bgg_family, only: [:show]

  # GET /bgg_families
  # GET /bgg_families.json
  def index
    q_param = params[:q] || {}
    page = params[:page]
    per_page = params[:per_page]

    @q = policy_scope(BggFamily).ransack q_param
    @q.sorts = 'name asc' if @q.sorts.empty?
    @bgg_families = @q.result(distinct: true).page(page).per(per_page).decorate
  end

  # GET /bgg_families/1
  # GET /bgg_families/1.json
  def show
    authorize @bgg_family
    results = WithGameSummaries::SearchAndPaginate.call(params:        params,
                                                        initial_scope: @bgg_family.game_summaries,
    )

    @q              = results.q
    @game_summaries = results.game_summaries

  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_bgg_family
    @bgg_family = BggFamily.friendly.find(params[:id]).decorate
  end
end
