require "rails_helper"

RSpec.describe "Course", type: :request do
  describe "POST /create" do
    let!(:my_course) { FactoryBot.create(:course) }

    before do
      post '/api/v1/courses', params:
                        { course: {
                          name: my_course.name,
                          description: my_course.description
                        } }
    end

    it 'returns the attributes' do
      expect(json['data']['attributes']['name']).to eq(my_course.name)
      expect(json['data']['type'].capitalize).to eq("Course")
    end

    scenario 'invalid course attributes' do
      post '/api/v1/courses', params:
                        { course: {
                          name: '',
                          description: "testing course"
                        } }

      expect(json['status']).to eq(422)
      expect(json['errors'].size).to eq(1)
    end

  end
end