class GameSummaryDecorator < Draper::Decorator
  delegate_all

  def player_range
    "#{object.min_players} - #{object.max_players}"
  end

  def categories
    object.bgg_links.select { |l| l.is_a? BggCategory }
  end

  def families
    object.bgg_links.select { |l| l.is_a? BggFamily }
  end

  def mechanics
    object.bgg_links.select { |l| l.is_a? BggMechanic }
  end

  # Define presentation-specific methods here. Helpers are accessed through
  # `helpers` (aka `h`). You can override attributes, for example:
  #
  #   def created_at
  #     helpers.content_tag :span, class: 'time' do
  #       object.created_at.strftime("%a %m/%d/%y")
  #     end
  #   end

end
