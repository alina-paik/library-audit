# frozen_string_literal: true

class AuthorsController < ApplicationController
  before_action :authentication, only: %i[invite_author]

  # GET /authors?page=:page
  def index
    authors = Author.page(params[:page])
    render json: authors, status: :ok
  end

  # GET /authors/:id
  def show
    author = Author.find_by(id: params[:id])
    render json: author, status: :ok
  end

  def invite_author
    author = Author.find(params[:author_id])
    render(json: { message: 'user_id is present' }, status: :unprocessable_entity) && return if author.user_id

    authorize! author
    token = SecureRandom.urlsafe_base64
    author.invite_token = token
    Rails.logger.info("for author with id: #{author.id} generate token #{token}")
    # TODO: ADD SEND MAIL
    if author.save
      render json: author, status: :ok
    else
      render json: author.errors, status: :unprocessable_entity
    end
  end
end
