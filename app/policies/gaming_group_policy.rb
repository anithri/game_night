class GamingGroupPolicy < ApplicationPolicy
  def index?
    true
  end

  def show?
    record.public_group? || record.summarized_group? || record.has_member?(user)
  end

  class Scope < Scope
    def resolve
      scope
    end
  end
end
