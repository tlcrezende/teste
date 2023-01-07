class Api::V1::BooksController < ApplicationController
  include Paginable

  before_action :set_book, only: [:show, :update, :destroy]

  def index
    @books = Book.search_by_title(params[:search_by_title])
                  .search_by_author(params[:search_by_author])
                  .search_by_genre(params[:search_by_genre])
                  .page(current_page)
                  .per(per_page) 

    render json: @books, meta: meta_attributes(@books), adapter: :json
  end

  def show
    render json: @book
  end

  def create
    @book = Book.new(book_params)

    if @book.save
      render json: @book, status: :created
    else
      render json: @book.errors, status: :unprocessable_entity
    end
  end

  def update
    if @book.update(book_params)
      render json: @book
    else
      render json: @book.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @book.destroy
  end

  private
    def set_book
      @book = Book.find(params[:id])
    end

    def book_params
      params.require(:book).permit(:title, :author, :genre)
    end
end
