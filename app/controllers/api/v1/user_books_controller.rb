class Api::V1::UserBooksController < ApplicationController
  include Paginable
  
  before_action :set_user_book, only: :destroy
  before_action :authenticate_api_user!

  # GET /user_books
  def index
    @user_books = current_api_user.books
                                  .search_by_title(params[:search_by_title])
                                  .search_by_author(params[:search_by_author])
                                  .search_by_genre(params[:search_by_genre])
                                  .page(current_page)
                                  .per(per_page) 

    render json: @user_books, meta: meta_attributes(@user_books), adapter: :json
  end

  # POST /user_books
  def create
    @user_book = current_api_user.user_books.new(user_book_params)

    if @user_book.save
      render json: @user_book, status: :created
    else
      render json: @user_book.errors, status: :unprocessable_entity
    end
  end

  # DELETE /user_books/1
  def destroy
    @user_book.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user_book
      @user_book = current_api_user.user_books.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def user_book_params
      params.require(:user_book).permit(:user_id, :book_id)
    end
end
