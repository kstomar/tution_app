# frozen_string_literal: true

require 'rails_helper'

RSpec.describe CoursesController, type: :controller do
  let!(:user) { create(:user) }

  before(:each) do
    sign_in(user)
  end

  describe 'GET index' do
    it 'respond with courses' do
      get :index, format: :json

      expect(response.media_type).to eq("application/json")
      expect(response).to have_http_status(200)
    end
  end

  describe 'GET show' do
    let!(:course) { create(:course) }
    it 'respond with course' do
      get :show, params: { id: course.id }, format: :json

      expect(response.media_type).to eq("application/json")
      expect(response).to have_http_status(200)
    end
  end

  describe 'POST create' do
    let!(:course_attributes) { attributes_for(:course) }
    it 'should create course' do
      post :create, params: { course: course_attributes}

      expect(response.media_type).to eq "text/html"
      expect(response).to have_http_status(302)
    end

    it 'should not create course and response with error'  do
      course_attributes.delete(:title)
      post :create, params: { course: course_attributes}, format: :json

      expect(response.media_type).to eq "application/json"
      response_body = JSON.parse response.body
      response_body['title'].should eql ["can't be blank"]
      expect(response).to have_http_status(422)
    end
  end

  describe 'PATCH update' do
    let!(:course) { create(:course) }
    it 'update course' do
      patch :update, params: { id: course.id, course: {title: "test2"}}

      expect(course.reload.title).to eq "test2"
      expect(response).to have_http_status(302)
    end

    it 'should not update course and return with error' do
      patch :update, params: { id: course.id, course: {title: nil}}, format: :json

      expect(course.reload.title).to_not eq "test2"
      response_body = JSON.parse response.body
      response_body['title'].should eql ["can't be blank"]
    end
  end

  describe 'DELETE destroy' do
    let!(:course) { create(:course) }
    it 'destroy course and redirect to index' do
      delete :destroy, params: { id: course.id }
      expect(response).to have_http_status(302)
    end
  end
end
