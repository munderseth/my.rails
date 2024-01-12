class ArticleCell < Cell::ViewModel

  def index
    @articles = Article.all
    render
  end
  def show
  end
end
