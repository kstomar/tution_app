require 'rails_helper'

RSpec.describe Course, type: :model do
  describe "association" do
    it { should have_many(:request_courses) }
    it { should have_many(:comments) }
  end

  describe "validation" do
    it { should validate_presence_of(:title) }
  end
end