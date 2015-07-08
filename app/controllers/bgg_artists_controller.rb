class BggArtistsController < ApplicationController
  before_action :set_bgg_artist, only: [:show, :edit, :update, :destroy]

  # GET /bgg_artists
  # GET /bgg_artists.json
  def index
    q_param = params[:q] || {}
    page = params[:page]
    per_page = params[:per_page]
    @q = policy_scope(BggArtist).ransack q_param
    @q.sorts = 'name asc' if @q.sorts.empty?
    @bgg_artists = @q.result(distinct: true).page(page).per(per_page).decorate
  end

  # GET /bgg_artists/1
  # GET /bgg_artists/1.json
  def show
    authorize @bgg_artist
    results = WithGameSummaries::SearchAndPaginate.call(params:        params,
                                                        initial_scope: @bgg_artist.game_summaries,
                                                        init_search: { game_summary_artists_bgg_artist_id_in_all: [@bgg_artist.id]}
    )

    @q              = results.q
    @game_summaries = results.game_summaries

  end

  private
    # Use callbacks to share common setup or constraints between actions.
  def set_bgg_artist
    @bgg_artist = BggArtist.friendly.find(params[:id]).decorate
  end
end
