class ArticleCell < Cell::ViewModel

  def show
    @articles = Article.all
    Rails.logger.debug "DEBUG: #{__method__}, #{__FILE__}:#{__LINE__}"
    render
  end
  def test
    render
  end
end
