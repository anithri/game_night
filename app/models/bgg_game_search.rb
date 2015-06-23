class BggGameSearch
  attr_accessor :search_term, :name, :id, :year_published
  def initialize(search_term:, name:,id:,year_published:)
    @search_term = search_term
    @name = name
    @id = id
    @year_published = year_published
  end

  def bgg_url
    "https://boardgamegeek.com/boardgame/#{self.id}"
  end


end

