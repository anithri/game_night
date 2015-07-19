# == Schema Information
#
# Table name: game_sessions
#
#  id           :integer          not null, primary key
#  session_date :date
#  location     :string
#  notes        :text
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

class GameSession < ActiveRecord::Base
end
