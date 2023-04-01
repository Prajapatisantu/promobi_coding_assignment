require "rails_helper"

RSpec.describe 'Course', type: :request do
  describe 'GET /index' do

    before do
      FactoryBot.create_list(:course, 10)
      get '/api/v1/courses'
    end

    it 'returns all courses' do
      expect(json['data'].size).to eq(10)
    end

    it 'returns status code 200' do
      expect(response).to have_http_status(:success)
    end
  end
end