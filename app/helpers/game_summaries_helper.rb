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
    Rails.cache.fetch 'all_machanics_links', expires_in: 1.hour do
      BggMechanic.all
    end
  end
end
