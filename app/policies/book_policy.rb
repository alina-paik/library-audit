# frozen_string_literal: true

class BookPolicy < ApplicationPolicy
  def update?
    current_author = user.author
    author_ids = record.authors.map(&:id)
    user.admin || author_ids.include?(current_author&.id)
  end

  def destroy?
    current_author = user.author
    author_ids = record.authors.map(&:id)
    user.admin || author_ids.include?(current_author&.id)
  end

  def add_author?
    current_author = user.author
    author_ids = record.authors.map(&:id)
    user.admin || author_ids.include?(current_author&.id)
  end

  def remove_author?
    current_author = user.author
    author_ids = record.authors.map(&:id)
    user.admin || author_ids.include?(current_author&.id)
  end
end
