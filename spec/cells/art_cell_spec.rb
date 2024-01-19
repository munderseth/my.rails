require 'rails_helper'

describe ArticleCell, type: :cell do
  controller ArticlesController
  it "render article" do
    FactoryBot.create(:article)
    #html = cell(:article).call(:test)
    html = cell(:article)

    Rails.logger.debug "HTML: #{html}"
    #expect(html).to have_content "test"

    #expect(html).to have_content "List of Articles 1.0"
    #expect(html).to have_selector('p', text: 'Our blog has')
    #expect(cell(:article).call).to have_content "List of Articles"
  end

end
