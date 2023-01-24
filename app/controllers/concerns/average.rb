module Average
  private

  # Calculates the average grades of the selected book
  def average_book
    sum_score = 0
    @reviews.each do |review|
      sum_score += review.score
    end

    @average = @reviews.count > 0 ? (sum_score/@reviews.count).round(2) : 0
  end
end