class GameLibraryPolicy < ApplicationPolicy
  def update?
    puts '#' * 30
    puts self.inspect
    puts '#' * 30
    user.id == record.player_id
  end

  class Scope < Scope
    def resolve
      scope
    end
  end
end
