require 'bgg'

class WithBggApi::ImportById
  include Interactor

  def call
    context.fail!(error: 'invalid bgg_id.') unless bgg_id.to_i > 0
    context.new_game = cache.fetch("with_bgg_api/#{bgg_id}", expires_in: 30.days) do
      begin
        game = ::Bgg::Game.find_by_id(bgg_id.to_i)
      rescue ArgumentError => e
        context.fail!(error: e.message)
        nil
      end
    end
  end

  def bgg_id
    context.bgg_id
  end

  def cache
    context.cache
  end
end

