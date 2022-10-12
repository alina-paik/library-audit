# frozen_string_literal: true

class AuthorPolicy < ApplicationPolicy
  def invite_author?
    user.admin
  end
end
