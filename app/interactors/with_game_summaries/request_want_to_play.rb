class WithGameSummaries::RequestWantToPlay
  include Interactor
  # results = WithGameSummaries::RequestWantToPlay.call(game_summary: @game_summary,
  #                                                     player: current_player)

  def call
    player.vote_exclusively_for game_summary
    context.notice = "You want to play #{game_summary.name}"
  end

  def player
    context.player
  end

  def game_summary
    context.game_summary
  end
end
