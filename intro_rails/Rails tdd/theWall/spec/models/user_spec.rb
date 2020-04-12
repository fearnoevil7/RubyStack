require 'rails_helper'

RSpec.describe User, type: :model do
  context "invalid login/register inputs" do
    it "should not save if username field is blank" do
      expect(build(:user, username: "")).to be_invalid
    end
    it "username should be atleast 5 characters long" do
      expect(build(:user, username: "Loco")).to be_invalid
    end
    it "username must be unique" do
      create(:user)
      expect(build(:user)).to be_invalid
    end
  end
  context "make sure valid inputs are created" do
    it "should create user" do
      expect(build(:user)).to be_valid
    end
  end
end
