class ArticleCell < Cell::ViewModel

=begin
  def show
    Rails.logger.debug "DEBUG(cell#show) This: #{model} #{__method__}, #{__FILE__}:#{__LINE__}"
    render
  end
=end

  def test
    Rails.logger.debug "This: #{model.inspect} #{__method__}, #{__FILE__}:#{__LINE__}"
    render
  end

  private

  def articles
    model
  end

  def version
    "List of Articles 1.0"
  end

  def num_of_articles
    Article.public_count
  end

end
