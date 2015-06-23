class WithBggApi::FindSummarizeImportById
  include Interactor

  def call
    context.game_summary = GameSummary.where(id: bgg_id ).first
    return if context.game_summary
    bgg_game_results = WithBggApi::ImportById.call(cache: cache, bgg_id: bgg_id)
    if bgg_game_results.success?
      bgg_game = bgg_game_results.new_game
      bgg_summary_results = WithBggApi::SummarizeGame.call(bgg_game: bgg_game, cache: cache)
      context.game_summary = bgg_summary_results.game_summary
      context.game_summary.save
    else
      context.fail error: bgg_game_results.error
    end
  end

  def bgg_id
    context.bgg_id
  end

  def cache
    context.cache
  end
end
