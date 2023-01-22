module Recommendation
  private
  
  def get_genres_most_read
    genres = {}
    current_api_user.books.each do |book|
      genres[book["genre"]] += 1 if genres.has_key?(book["genre"])
      genres[book["genre"]] = 1 unless genres.has_key?(book["genre"])
    end

    genres_sorteds = genres.sort_by {|key, value| -value}
    genres_sorteds = [[Faker::Number.between(from: 1, to: 9)], [Faker::Number.between(from: 1, to: 9)]] if genres_sorteds.count == 0
    genres_sorteds[1] = genres_sorteds[0] if genres_sorteds.count == 1
    genres_most_read = [genres_sorteds[0][0], genres_sorteds[1][0]]
  end

  def get_books_recommendation
    genres_most_read = get_genres_most_read
    books_recommmendation = {}
    Book.where(genre: genres_most_read[0]).each do |book_review|
      number_reviews = 0
      total_score = 0
      book_review.reviews.each do |review|
        number_reviews += 1
        total_score += review.score if review.present?
      end
      avg = total_score/number_reviews if total_score != 0
      books_recommmendation[book_review.id] = avg if total_score != 0
    end
    books_recommmendation_sorteds = books_recommmendation.sort_by {|key, value| -value}
    books_recommmendation_sorteds = [[15], [16], [17]] if books_recommmendation_sorteds.count == 0
  end

  def get_recommendation
    books_recommmendation = get_books_recommendation
    return recommendation_output = [Book.find(10)] if books_recommmendation.nil? 

    stop_recommendation = 0
    recommendation_output = [] 
    books_recommmendation.each do |recommendation|
      stop_recommendation += 1
      recommendation_output << Book.find(recommendation[0]) 
      break if stop_recommendation == 3
    end
    recommendation_output
  end

  def get_first_recommendation
    @first_recommendarion = get_recommendation
    @first_recommendarion[0]
  end

  def get_other_recommendation
    @others_recommendarion = get_recommendation
    @others_recommendarion[1, 2] 
    @others_recommendarion = {message: "We cant calculate any recommendation, please add more books to your virtual library"} if get_recommendation.count < 2
  end
end