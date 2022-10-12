# frozen_string_literal: true

class BooksController < ApplicationController
  before_action :authentication, except: %i[index show]
  before_action :set_book, only: %i[show update destroy add_author remove_author]

  # GET /books?page=:page
  def index
    @books = Book.page(params[:page])
    render json: @books, status: :ok
  end

  # GET /books/:id
  def show
    render json: @book, status: :ok
  end

  # POST /books
  def create
    author = (Author.find_by(user_id: user.id) || Author.create(user_id: user.id, name: user.username))
    # author = Author.find_by(user_id: user.id)
    # author = Author.create(user_id: user.id, name: user.username) unless author

    category = Category.find(params[:book][:category_id])

    @book = Book.new(book_params)
    @book.categories << category
    @book.authors << author
    save_book
  end

  # POST books/:id/authors
  def add_author
    authorize! @book
    find_author
    if @author_ids.include?(params[:author_id])
      render json: { message: 'author is present' }
    elsif (author = Author.find_by(id: params[:author_id])).present?
      @book.authors << author
      save_book
    else
      render json: { message: 'author not found' }
    end
  end

  # DEL books/:id/authors
  def remove_author
    authorize! @book
    find_author
    author = Author.find_by(id: params[:author_id])
    if @author_ids.include?(params[:author_id])
      @book.authors.delete(author)
      render json: @book, status: :ok
    else
      render json: { message: 'author not found' }
    end
  end

  # PUT /books/ :id
  def update
    authorize! @book
    if @book.update(book_params)
      render json: @book
    else
      render json: @book.errors, status: :unprocessable_entity
    end
  end

  # DEL /books/ :id
  def destroy
    authorize! @book
    @book.destroy
  end

  private

  def set_book
    @book = Book.find_by(id: params[:id])
  end

  def book_params
    params.require(:book).permit(:name, :description)
  end

  def save_book
    if @book.save
      render json: @book, status: :ok
    else
      render json: @book.errors, status: :unprocessable_entity
    end
  end

  def find_author
    @author_ids = @book.authors.map(&:id)
  end
end
