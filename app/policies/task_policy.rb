class TaskPolicy < ApplicationPolicy
    def update?
      user.admin? || user.moderator? || record.try(:user) == user
    end
end