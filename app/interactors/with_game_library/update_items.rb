class WithGameLibrary::UpdateItems
  include Interactor

  # results = WithGameLibrary::UpdateItems.call(game_library: @game_library,
  #                                            game_summary_ids: game_library_params[:game_summary_ids] )

  def call
    prior_ids = game_summaries.pluck(:id)
    Array(game_summary_ids).map(&:to_i).each do |gsid|
      gs = GameSummary.find(gsid.abs)
      if gsid > 0
        next if prior_ids.include?(gsid)
        context.notice = "#{gs.name} added to library."
        game_summary = WithBggApi::FindSummarizeImportById.call(bgg_id: gsid, cache: context.cache).game_summary
        new_item = GameLibraryItem.find_or_create_by(game_library_id: game_library.id,
                                                     game_summary_id: gsid
        )
      else
        next unless prior_ids.include?(- gsid)
        context.notice = "#{gs.name} removed from library."
        GameLibraryItem.where(game_library: game_library,game_summary_id: - gsid).delete_all
      end

    end

    # TODO
  end

  def game_summary_ids
    context.game_summary_ids
  end

  def game_summaries
    game_library.game_summaries
  end

  def game_library
    context.game_library
  end

end
