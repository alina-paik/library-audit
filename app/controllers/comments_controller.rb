# frozen_string_literal: true

class CommentsController < ApplicationController
  before_action :authentication, except: %i[index]
  before_action :set_book

  # GET /books/:id/comments
  def index
    comments = @book.comments
    render json: comments, status: :ok
  end

  # POST /books/:id/comments
  def create
    comment = Comment.new(comment_params)
    if comment.save
      render json: comment, status: :created
    else
      render json: comment.errors, status: :unprocessable_entity
    end
  end

  # PUT /books/:id/comments/:id
  def update
    @comment = Comment.find(params[:id])
    authorize! @comment
    if @comment.update(update_comment)
      render json: @comment
    else
      render json: @comment.errors, status: :unprocessable_entity
    end
  end

  # DEL /books/:id/comments/:id
  def destroy
    @comment = Comment.find(params[:id])
    authorize! @comment
    @comment.destroy
  end

  private

  def set_book
    @book = Book.find_by(id: params[:id])
  end

  def comment_params
    params.require(:comment).permit(:value, :book_id).merge(user_id: user.id)
  end

  def update_comment
    params.require(:comment).permit(:value)
  end
end
