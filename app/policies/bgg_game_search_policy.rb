class BggGameSearchPolicy < ApplicationPolicy
  def show?
    user.is_a? Player
  end
  def new?
    user.is_a? Player
  end
  def create?
    user.is_a? Player
  end

end
