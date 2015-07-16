class BggPublishersController < ApplicationController
  before_action :set_bgg_publisher, only: [:show, :edit, :update, :destroy]

  # GET /bgg_publishers
  # GET /bgg_publishers.json
  def index
    q_param = params[:q] || {}
    page = params[:page]
    per_page = params[:per_page]
    @q = policy_scope(BggPublisher).ransack q_param
    @q.sorts = 'name asc' if @q.sorts.empty?
    @bgg_publishers = @q.result(distinct: true).page(page).per(per_page).decorate
  end

  # GET /bgg_publishers/1
  # GET /bgg_publishers/1.json
  def show
    authorize @bgg_publisher
    results = WithGameSummaries::SearchAndPaginate.call(params:        params,
                                                        initial_scope: @bgg_publisher.game_summaries,
                                                        init_search: { game_summary_summaries_bgg_summary_id_in_all: [@bgg_publisher.id]}
    )

    @q              = results.q
    @game_summaries = results.game_summaries

  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_bgg_publisher
    @bgg_publisher = BggPublisher.includes(:game_summaries).friendly.find(params[:id]).decorate
  end
end
