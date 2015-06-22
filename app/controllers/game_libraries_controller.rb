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
  end

  # PATCH/PUT /game_libraries/1
  # PATCH/PUT /game_libraries/1.json
  def update
    authorize @game_library
    respond_to do |format|
      if @game_library.update(game_library_params)
        format.html { redirect_to @game_library, notice: 'Game library was successfully updated.' }
        format.json { render :show, status: :ok, location: @game_library }
      else
        format.html { render :edit }
        format.json { render json: @game_library.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_game_library
      @game_library = GameLibrary.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def game_library_params
      params.require(:game_library).permit(:player_id)
    end
end
