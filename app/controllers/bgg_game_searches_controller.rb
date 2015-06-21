class BggGameSearchesController < ApplicationController

  # GET /bgg_game_searches
  # GET /bgg_game_searches.json
  def index
    raise Pundit::NotAuthorizedError, "must be logged in" if current_user.is_a? GuestUser
  end

  def show
    raise Pundit::NotAuthorizedError, "must be logged in" if current_user.is_a? GuestUser
    @term = params[:id]
    results = WithBggApi::SearchByName.call search_term: @term, cache: Rails.cache
    @results = results.found_games
  end

  def create
    raise Pundit::NotAuthorizedError, "must be logged in" if current_user.is_a? GuestUser
    @term = params[:bgg_game_name_cont]
    redirect_to proc { "/bgg_game_searches/#{@term}"}
  end

end
