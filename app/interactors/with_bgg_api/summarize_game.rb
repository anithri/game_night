class WithBggApi::SummarizeGame
  include Interactor

  def call
    context.fail!(error: "unknown game: #{bgg_game.inspect}") unless bgg_game.is_a? Bgg::Game
    context.game_summary = GameSummary.find_or_create_by(bgg_id: bgg_game.id)
    context.game_summary.update(
        name:           bgg_game.name,
        thumbnail_url:  bgg_game.thumbnail,
        image_url:      bgg_game.image,
        year_published: bgg_game.year_published,
        min_players:    bgg_game.min_players,
        max_players:    bgg_game.max_players,
        playing_time:   bgg_game.playing_time,
        description:    bgg_game.description,
    )

    bgg_game.bgg_links.each do |bgg_link|
      next if skip_link?(bgg_link)
      link_class = "Bgg#{bgg_link.bgg_type.capitalize}".constantize
      container = "bgg_#{bgg_link.bgg_type.pluralize}".intern
      new_link   = link_class.find_or_create_by(bgg_id: bgg_link.id)
      new_link.update(name: bgg_link.value)
      context.game_summary.send(container) << new_link
    end
    context.game_summary.save
  end

  def bgg_game
    context.bgg_game
  end

  def skip_link?(link)
    ['expansion', 'implementation'].include? link.bgg_type
  end
end
