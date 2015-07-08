class WithBggApi::ImportHotFifty
  include Interactor

  def call
    all = Bgg::Request::Hot.board_games.get.to_a
    GameSummary.update_all(bgg_game_rank: 100)

    all.each do |bg_data|
      imported =  WithBggApi::FindSummarizeImportById.call cache: context.cache, bgg_id: bg_data.id
      context.game_summary = imported.game_summary
      if context.game_summary
        context.game_summary.bgg_game_rank = bg_data.rank
        context.game_summary.save
      end
      sleep(rand(5) + 1)

    end
    # TODO
  end
end
