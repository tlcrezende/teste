module Average
  private

  # Calcula a média das notas do livro selecionado 
  def average_book
    sum_score = 0
    @reviews.each do |review|
      sum_score += review.score
    end

    @average = (sum_score/@reviews.count).round(2)
  end

end