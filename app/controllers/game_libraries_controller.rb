class GameLibrariesController < ApplicationController
  before_action :set_game_library, only: [:show, :edit, :update]
  respond_to :html, :js, :json
  # GET /game_libraries
  # GET /game_libraries.json
  def index
    @game_libraries = policy_scope(GameLibrary).includes(:game_summaries).all
  end

  # GET /game_libraries/1
  # GET /game_libraries/1.json
  def show
    authorize @game_library
    results = WithGameSummaries::SearchAndPaginate.call(params:        params,
                                                        initial_scope: @game_library.game_summaries,
                                                        init_search:   {game_library_items_game_library_id_in_all: [@game_library.id]}
    )

    @q              = results.q
    @game_summaries = results.game_summaries
  end

  # PATCH/PUT /game_libraries/1
  # PATCH/PUT /game_libraries/1.json
  def update
    authorize @game_library
    results = WithGameLibrary::UpdateItems.call(game_library:     @game_library, cache: Rails.cache,
                                                game_summary_ids: game_library_params[:game_summary_ids],
                                                wish_list:        current_player.wish_list,
    )
    respond_to do |format|
      if results.success?
        format.html { redirect_to @game_library, notice: 'Game library was successfully updated.' }
        format.json { render :show, status: :ok, location: @game_library }
        format.js { flash[:notice] = results.notice; flash.each{|k,v| warn [k,v].inspect} }
      else
        format.html { redirect_to @game_library, notice: "Could not add item: #{results.error}." }
        format.json { render json: results.error, layout: false, status: :unprocessable_entity }
      end
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_game_library
    @game_library = GameLibrary.friendly.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def game_library_params
    params.require(:game_library).permit(:game_summary_ids)
  end
end
