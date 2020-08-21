# frozen_string_literal: true

require 'rails_helper'

RSpec.describe RequestCoursesController, type: :controller do
  let!(:user) { create(:user) }
  let!(:course) { create(:course) }
  let!(:request_course) { create(:request_course, user_id: user.id, course_id: course.id) }

  before(:each) do
    sign_in(user)
  end

  describe 'GET index' do
    it 'respond with requestd courses' do
      get :index, format: :json

      expect(response.media_type).to eq("application/json")
      expect(response).to have_http_status(200)
    end

    it 'respond with requestd courses current user is teacher' do
      user.update(role: "teacher")
      get :index, format: :json

      expect(response.media_type).to eq("application/json")
      expect(response).to have_http_status(200)
    end
  end

  describe 'GET show' do
    it 'respond with request_course' do
      get :show, params: { id: request_course.id }, format: :json

      expect(response.media_type).to eq("application/json")
      expect(response).to have_http_status(200)
    end
  end

  describe 'POST create' do
    let!(:course2) { create(:course) }
    it 'should create request to join course' do
      post :create, params: { course_id: course2.id }, format: :json

      expect(response.media_type).to eq "application/json"
      expect(response).to have_http_status(200)
    end

    it 'show error if already joined' do
      post :create, params: { course_id: course.id }, format: :json

      expect(response.media_type).to eq "application/json"
      response_body = JSON.parse response.body
      response_body['course'].should eql ["has already been taken"]
    end
  end

  describe 'PATCH update' do
    it 'update request_course' do
      user.update(role: "teacher")
      patch :update, params: { id: request_course.id, request_course: { status: "accept" } }

      expect(request_course.reload.status).to eq "accept"
      expect(response).to have_http_status(302)
    end
  end

end
