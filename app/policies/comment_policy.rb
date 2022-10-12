# frozen_string_literal: true

class CommentPolicy < ApplicationPolicy
  def update?
    user.id == record.user_id
  end

  def destroy?
    user.admin || user.id == record.user_id
  end
end
