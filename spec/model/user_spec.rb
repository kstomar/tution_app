require 'rails_helper'

RSpec.describe User, type: :model do
  describe "association" do
    it { should have_many(:request_courses) }
    it { should have_many(:comments) }
  end
end