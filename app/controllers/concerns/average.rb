module Average
  private

  def average_book
    sum_score = 0
    @reviews.each do |review|
      sum_score += review.score
    end

    @average = sum_score/@reviews.count
  end

end