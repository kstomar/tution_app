# frozen_string_literal: true

require 'rails_helper'

RSpec.describe CommentsController, type: :controller do
  let!(:user) { create(:user) }
  let!(:course) { create(:course) }


  before(:each) do
    sign_in(user)
  end

  describe 'POST create' do
    let!(:comment_attributes) { attributes_for(:comment, user_id: user.id, course_id: course.id) }
    it 'should create comment' do
      post :create, params: { comment: comment_attributes}, format: :json

      expect(response.media_type).to eq "application/json"
      expect(response).to have_http_status(:success)
    end
  end

  describe 'DELETE destroy' do
    let!(:comment) { create(:comment, user_id: user.id, course_id: course.id) }

    it 'destroy comment' do
      delete :destroy, params: { id: comment.id }
      expect(response).to have_http_status(204)
    end
  end
end
