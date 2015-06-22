class BggGameSearchesController < ApplicationController

  def show
    @term = params[:id]
    authorize :bgg_game_search, :show?
    results = WithBggApi::SearchByName.call search_term: @term, cache: Rails.cache
    @results = results.found_games
  end

  def new
    authorize :bgg_game_search, :new?
  end

  def create
    @term = params[:bgg_game_name_cont]
    authorize :bgg_game_search, :create?
    redirect_to proc { "/bgg_game_searches/#{@term}"}
  end

end
