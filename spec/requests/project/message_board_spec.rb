require 'rails_helper'

RSpec.describe "Project::MessageBoards", type: :request do
  describe "GET /index" do
    it "returns http success" do
      get "/project/message_board/index"
      expect(response).to have_http_status(:success)
    end
  end
end
