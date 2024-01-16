require 'rails_helper'

describe ArticleCell do
  it 'case1' do
    cell_obj = ArticleCell.new
    html = cell_obj.test
    Rails.logger.debug "T2: #{html}"
    expect(html).to eq("<p>test</p>")
  end
end