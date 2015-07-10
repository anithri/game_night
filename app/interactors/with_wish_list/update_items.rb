class WithWishList::UpdateItems
  include Interactor

  def call
    prior_ids = game_summaries.pluck(:id)
    Array(game_summary_ids).map(&:to_i).each do |gsid|
      warn "#### #{gsid} ####"
      if gsid > 0
        next if prior_ids.include?(gsid)
        game_summary = WithBggApi::FindSummarizeImportById.call(bgg_id: gsid, cache: context.cache).game_summary
        new_item = WishListItem.find_or_create_by(wish_list_id: wish_list.id,
                                                     game_summary_id: gsid
        )
        context.notice = "#{game_summary.name} added to wish list."
      else
        next unless prior_ids.include?(- gsid)
        gs = GameSummary.find(- gsid)
        context.notice = "#{gs.name} removed from wish list."
        WishListItem.where(wish_list: wish_list, game_summary_id: - gsid).destroy_all
      end

    end

    # TODO
  end

  def game_summary_ids
    context.game_summary_ids
  end

  def game_summaries
    wish_list.game_summaries
  end

  def wish_list
    context.wish_list
  end

end
