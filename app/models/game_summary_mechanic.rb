class GameSummaryMechanic < ActiveRecord::Base
  belongs_to :game_summary
  belongs_to :bgg_mechanic

end
