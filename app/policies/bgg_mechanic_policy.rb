class BggMechanicPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope
    end
  end
end
