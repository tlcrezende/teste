class Api::V1::ReviewsController < ApplicationController
  # before_action :set_review
include Average

  before_action :authenticate_api_user!, only: :create
  before_action :set_review_books, :average_book, only: :index_book
  before_action :set_review_users, only: :index_user

  def index
    @reviews = Review.all

    render json: @reviews
  end

  def create
    @review = current_api_user.reviews.new(review_params)

    if @review.save
      render json: @review, status: :created
    else
      render json: @review.errors, status: :unprocessable_entity
    end
  end

  def index_book
    # sum_score = 0
    # @reviews.each do |review|
    #   sum_score += review.score
    # end

    # average = sum_score/@reviews.count

    render json: {average: @average, reviews: @reviews}
  end

  def index_user
    render json: @reviews
  end

  private
    def set_review
      @review = Review.find(params[:id])
    end

    def set_review_books
      @reviews = Book.find(params[:id]).reviews
    end

    def set_review_users
      @reviews = User.find(params[:id]).reviews
    end

    def review_params
      params.require(:review).permit(:user_review, :score, :user_id, :book_id)
    end
end
