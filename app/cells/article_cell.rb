class ArticleCell < Cell::ViewModel

# Default execution
=begin
  def show
    render
  end
=end

  def test
    Rails.logger.debug "DEBUG(article.call(:test)): #{__method__}, #{__FILE__}:#{__LINE__}"
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
