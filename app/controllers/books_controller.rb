class BooksController < ApplicationController
  before_action :authentication, except: %i[index show]
  before_action :set_book, only: %i[show]

  # GET /books
  def index
    @books = Book.all
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

    @book = Book.new(book_create_params)
    @book.categories << category
    @book.authors << author
    if @book.save
         render json: @book, status: :created, location: @book
    else
         render json: @book.errors, status: :unprocessable_entity
    end
  end

  
  private

  def set_book
      @book = Book.find_by(id: params[:id])
  end

  def book_create_params
      params.require(:book).permit(:name, :description)
  end
end
