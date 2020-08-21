require 'rails_helper'

RSpec.describe Comment, type: :model do
  describe "association" do
    it { should belong_to(:user)}
    it { should belong_to(:course)}
  end
end