require 'bgg'
class WithBggApi::SearchByName
  include Interactor

  def call
    context.fail!(error: 'not enough letters in search term') unless term_ok?(search_term)

    #context.items = {items: GameSummary.all.to_a.map{|gs| {id: gs.bgg_id, text: gs.name}}}
    context.bgg_results = search_bgg(search_term)
    context.found_games = {items: prep_results(context.bgg_results)}
  end

  def search_bgg(search_term)
    cache.fetch "with_bgg_api/search_for_#{search_term}", expires_in: 1.day do
      Bgg::Request::Search.board_games(search_term)
    end
  end

  def prep_results(search_results)
    search_results.get.board_games.map do |sr|
      existing = GameSummary.where(id: sr.id).first
      if existing
        existing
      else
        BggGameSearch.new(id: sr.id, name: sr.name, year_published: sr.year_published, search_term: search_term)
      end
    end
  end

  def search_term
    context.search_term
  end

  def term_ok?(search_term)
    search_term.length > 2
  end

  def cache
    context.cache
  end
end
