# frozen_string_literal: true

class AuthorsController < ApplicationController
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
end
