require 'rails_helper'

RSpec.describe "Project::Messages", type: :request do
  describe "GET /new" do
    it "returns http success" do
      get "/project/message/new"
      expect(response).to have_http_status(:success)
    end
  end
end
