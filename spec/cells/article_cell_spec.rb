require 'rails_helper'

describe ArticleCell, type: :cell do
  controller ArticlesController

  let(:cell_object) { cell('article', @articles) }

  context 'cell rendering' do
    subject { cell_object.call(:show) }

    before(:each) do
      create(:article)
      @articles = Article.all
    end

    it "simple html verification" do
      Rails.logger.debug "HTML: #{subject}"
      expect(subject).to have_content "List of Articles 1.0"
      expect(subject).to have_content "#{@articles.count} articles and counting!"
    end
    it { expect(subject).to have_content "List of Articles 1.0" }
    it { is_expected.to have_selector('p', text: 'Our blog') }
    it { is_expected.to have_selector('h1', text: "List of Articles #{@articles.count}") }
  end

  context 'mocking examples' do

    subject { cell_object.call(:test)  }

    it "mock title method" do
      @my_article = build(:article) # @my_article = Article.new(title: "t1", body: "b1", status: "public")
      @my_article.expects(:title).returns("return Mock Title ")
      Article.expects(:find).with(1).returns(@my_article)
      find = Article.find(1)
      Rails.logger.debug "Expect Title: #{find.title}"
    end

    it "mock cell call" do
      cell_object.expects(:cell).with('testit').returns("mocking: cell/testit_cell.rb#cell/testit/show.erb")
      create(:article)
      @articles = Article.all
      Rails.logger.debug "Mocking Cell: #{subject}"
    end

  end

end

