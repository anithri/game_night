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

  # GET /game_summaries/want_to_play
  def want_to_play
    results         = WithGameSummaries::FindWantToPlay.call(since: 30.days.ago)
    @q              = results.q
    @game_summaries = results.game_summaries
  end


  # GET /games/1
  # GET /games/1.json
  def show
    @game_summary = GameSummary.find(params[:id]).decorate
    authorize @game_summary
  end

  def request_play

    @game_summary = GameSummary.find(params[:id]).decorate
    authorize @game_summary, :request_play?
    results = WithGameSummaries::RequestWantToPlay.call(game_summary: @game_summary,
                                                        player: current_player)
    flash[:notice] = "Added #{@game_summary.name} to the want to play list."
  end

  private
  # Use callbacks to share common setup or constraints between actions.

end
