class GameSummariesController < ApplicationController

  # GET /games
  # GET /games.json
  def index
    q_param = params[:q] || {}
    page = params[:page]
    per_page = params[:per_page]
    @q = policy_scope(GameSummary).ransack q_param
    @q.sorts = 'name asc' if @q.sorts.empty?
    @game_summaries = @q.result(distinct: true).page(page).per(per_page)
  end

  # GET /games/1
  # GET /games/1.json
  def show
    @game_summary = GameSummary.find(params[:id]).decorate
    authorize @game_summary
  end

  private
  # Use callbacks to share common setup or constraints between actions.

end
