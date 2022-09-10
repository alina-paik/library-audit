# frozen_string_literal: true

class AuthorsController < ApplicationController
  # GET /authors
  def index
    authors = Authors.all
    render json: authors, status: :ok
  end

  # GET /authors/:id
  def show
    author = Author.find_by(id: params[:id])
    render json: author, status: :ok
  end
end
