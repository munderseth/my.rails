require 'rails_helper'

describe ArticleCell, type: :cell do
  controller ArticlesController

  context 'cell rendering' do
    it "simple test" do
      create(:article)
      create(:article)
      @articles = Article.all
      html = cell(:article, @articles).call(:show)
      Rails.logger.debug "HTML: #{html}"
      expect(html).to have_content "List of Articles 1.0"
    end

    #subject { cell(:article).() }
    #it { is_expected.to have_selector('p', text: 'Our blog has') }
    #it { is_expected.to have_selector('h1', text: 'List of Articles 2.0 ') }
    #it { is_expected.to have_content "articles and counting!" }
    #it {expect(subject).to have_content "articles and counting!" }
  end

end

