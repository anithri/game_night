class GameLibrariesController < ApplicationController
  before_action :set_game_library, only: [:show, :edit, :update, :destroy]

  # GET /game_libraries
  # GET /game_libraries.json
  def index
    @game_libraries = policy_scope(GameLibrary).all
  end

  # GET /game_libraries/1
  # GET /game_libraries/1.json
  def show
    authorize @game_library
    results =  WithGameSummaries::SearchAndPaginate.call(params:        params,
                                                        initial_scope: @game_library.game_summaries,
    )

    @q              = results.q
    @game_summaries = results.game_summaries
  end

  # PATCH/PUT /game_libraries/1
  # PATCH/PUT /game_libraries/1.json
  def update
    authorize @game_library
    results = WithGameLibrary::UpdateItems.call(game_library: @game_library, cache: Rails.cache,
                                                game_summary_ids: game_library_params[:game_summary_ids] )
    respond_to do |format|
      if results.success?
        format.html { redirect_to @game_library, notice: 'Game library was successfully updated.' }
        format.json { render :show, status: :ok, location: @game_library }
      else
        format.html { redirect_to @game_library, notice: "Could not add item: #{results.error}." }
        format.json { render json: results.error, status: :unprocessable_entity }
      end

    end


    #
    # respond_to do |format|
    #   if @game_library.update(game_library_params)
    #     format.html { redirect_to @game_library, notice: 'Game library was successfully updated.' }
    #     format.json { render :show, status: :ok, location: @game_library }
    #   else
    #     format.html { render :edit }
    #     format.json { render json: @game_library.errors, status: :unprocessable_entity }
    #   end
    # end
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
