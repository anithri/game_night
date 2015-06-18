module GameSummariesHelper

  def all_categories_links
    Rails.cache.fetch 'all_categories_links', expires_in: 1.hour do
      BggCategory.all
    end
  end
  def all_families_links
    Rails.cache.fetch 'all_families_links', expires_in: 1.hour do
      BggFamily.all
    end
  end
  def all_mechanics_links
    Rails.cache.fetch 'all_mechanics_links', expires_in: 1.hour do
      BggMechanic.all
    end
  end
  def all_artists_links
    Rails.cache.fetch 'all_artists_links', expires_in: 1.hour do
      BggArtist.all
    end
  end
  def all_designers_links
    Rails.cache.fetch 'all_designers_links', expires_in: 1.hour do
      BggDesigner.all
    end
  end
  def all_publishers_links
    Rails.cache.fetch 'all_publishers_links', expires_in: 1.hour do
      BggPublisher.all
    end
  end


end

