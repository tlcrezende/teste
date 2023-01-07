class Api::V1::UserBooksController < ApplicationController
  include Paginable
  
  before_action :set_user_book, only: :destroy
  before_action :authenticate_api_user!

  def index
    @user_books = current_api_user.books
                                  .search_by_title(params[:search_by_title])
                                  .search_by_author(params[:search_by_author])
                                  .search_by_genre(params[:search_by_genre])
                                  .page(current_page)
                                  .per(per_page) 

    render json: @user_books, meta: meta_attributes(@user_books), adapter: :json
  end

  def create

    #Verifica se o livro já existe na biblioteca pessoa do usuário, caso positivo, não duplica o registro
    if current_api_user.user_books.where(book_id: user_book_params[:book_id]).empty?
      
      @user_book = current_api_user.user_books.new(user_book_params)

      if @user_book.save
        render json: @user_book, status: :created
      else
        render json: @user_book.errors, status: :unprocessable_entity
      end
    else
      render json: {"message": "Livro já adicionado"}, status: :ok
    end
  end

  def destroy
    @user_book.destroy unless @user_book.nil?
    render status: :ok
  end

  private
    def set_user_book
      @user_book = current_api_user.user_books.where(book_id: params[:id]).first
    end

    def user_book_params
      params.require(:user_book).permit(:user_id, :book_id)
    end
end
