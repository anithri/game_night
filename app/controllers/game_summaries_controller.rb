class GameSummariesController < ApplicationController

  # GET /games
  # GET /games.json
  def index
    results = WithGameSummaries::SearchAndPaginate.call(params:        params,
                                                        initial_scope: policy_scope(GameSummary),
    )

    @q              = results.q
    @game_summaries = results.game_summaries
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
