require 'rails_helper'

RSpec.describe "Homes", type: :request do

  describe "GET /encode" do
    it "returns http success" do
      get "/encode/#{Faker::Internet.url}"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /:key" do
    it "returns http success" do
      key = SecureRandom.uuid[0...5]
      get "/#{key}"
      expect(response).to have_http_status(:success)
    end
  end

end
