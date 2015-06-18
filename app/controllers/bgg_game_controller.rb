class BggGameController < ApplicationController
  def search
    results = WithBggApi::SearchByName.call search_term: params['q'], cache: Rails.cache

    render json: (results.found_games || {error: results.error})

  end
end

