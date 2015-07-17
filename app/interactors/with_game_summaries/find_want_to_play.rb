class WithGameSummaries::FindWantToPlay
  include Interactor

  def call
    #yes this is lazy
    game_ids = Vote.where(voteable_type: 'GameSummary').
                 where('created_at > ?', since).
                 pluck(:voteable_id)

    context.game_summaries =  GameSummary.where(id: game_ids)
    context.q = GameSummary.ransack {}

  end

  def since
    context.since || 30.days.ago
  end

end
