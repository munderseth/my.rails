require 'rails_helper'

RSpec.describe "Api::Events", type: :request do
  describe "GET /create" do
    it "returns http success" do
      get "/api/events/create"
      expect(response).to have_http_status(:success)
    end
  end

end
