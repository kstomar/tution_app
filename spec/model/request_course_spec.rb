require 'rails_helper'

RSpec.describe RequestCourse, type: :model do
  let!(:user) { create(:user) }
  let!(:course) { create(:course) }
  let!(:request_course) { create(:request_course, user_id: user.id, course_id: course.id) }

  describe "association" do
    it { should belong_to(:user)}
    it { should belong_to(:course)}
  end

  describe "validation" do
    #it { should validate_uniqueness_of(:course).scoped_to(:user_id) }
  end

  describe "scope" do
    it "should return user's this month courses" do
      expect(user.request_courses.this_month.present?).to eq(true)
    end
  end

  describe "notify_user" do
    it "notify user" do
      response = request_course.update(status: "accept")
      expect(response).to eq(true)
    end
  end
end