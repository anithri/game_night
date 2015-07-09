class GameLibraryPolicy < ApplicationPolicy
  def update?
    user.id == record.player_id
  end

  class Scope < Scope
    def resolve
      scope
    end
  end
end
