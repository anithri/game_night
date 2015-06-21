class BggArtistsController < ApplicationController
  before_action :set_bgg_artist, only: [:show, :edit, :update, :destroy]

  # GET /bgg_artists
  # GET /bgg_artists.json
  def index
    q_param = params[:q] || {}
    page = params[:page]
    per_page = params[:per_page]
    @q = BggArtist.ransack q_param
    @q.sorts = 'name asc' if @q.sorts.empty?
    @bgg_artists = @q.result(distinct: true).page(page).per(per_page).decorate
  end

  # GET /bgg_artists/1
  # GET /bgg_artists/1.json
  def show
  end

  private
    # Use callbacks to share common setup or constraints between actions.
  def set_bgg_artist
    @bgg_artist = BggArtist.find(params[:id]).decorate
  end
end
