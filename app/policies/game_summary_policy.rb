class GameSummaryPolicy < ApplicationPolicy

  def request_play?
    ! user.is_a? GuestUser
  end
  class Scope < Scope
    def resolve
      scope
    end
  end
end
