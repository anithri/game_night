class GameLibraryPolicy < ApplicationPolicy

  def show?
    true
  end

  def update?
    record.librarian == user
  end

  def create?
    update?
  end

  class Scope < Scope
    def resolve
      scope
    end
  end
end
