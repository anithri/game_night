module GameSummariesHelper

  def rank_badge(gs)
    return '' if gs.bgg_game_rank > 50
    content_tag :span, class: 'badge' do
      "BGG ##{gs.bgg_game_rank}"
    end
  end

  def library_count(gs)
    return '' if gs.game_library_items_count == 0
    content_tag :span, class: 'badge' do
      "In #{gs.game_library_items_count} #{'Lib'.pluralize(gs.game_library_items_count)}"
    end
  end

  def wish_list_count(gs)
    return '' if gs.wish_list_items_count == 0
    content_tag :span, class: 'badge' do
      "In #{gs.wish_list_items_count} #{'Wish List'.pluralize(gs.wish_list_items_count)}"
    end
  end

  def all_categories_links
    Rails.cache.fetch 'all_categories_links', expires_in: 1.hour do
      BggCategory.order(:name).all
    end
  end
  def all_families_links
    Rails.cache.fetch 'all_families_links', expires_in: 1.hour do
      BggFamily.order(:name).all
    end
  end
  def all_mechanics_links
    Rails.cache.fetch 'all_mechanics_links', expires_in: 1.hour do
      BggMechanic.order(:name).all
    end
  end
  def all_artists_links
    Rails.cache.fetch 'all_artists_links', expires_in: 1.hour do
      BggArtist.order(:name).all
    end
  end
  def all_designers_links
    Rails.cache.fetch 'all_designers_links', expires_in: 1.hour do
      BggDesigner.order(:name).all
    end
  end
  def all_publishers_links
    Rails.cache.fetch 'all_publishers_links', expires_in: 1.hour do
      BggPublisher.order(:name).all
    end
  end

  def all_visible_libraries
    Rails.cache.fetch 'all_visible_libraries', expires_in: 1.hour do
      GameLibrary.order(:name).all
    end
  end


end

