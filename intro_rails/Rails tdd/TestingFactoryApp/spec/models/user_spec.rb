require 'rails_helper'
RSpec.describe User, type: :model do
  context "With valid attributes" do 
    it "should save" do 
      expect(build(:user, :male)).to be_valid
    end
  end
  context "With invalid attributes" do 
    it "should not save if first_name field is blank" do
      expect(build(:user, first_name: "")).to be_invalid
    end
    it "should not save if last_name field is blank" do
      expect(build(:user, last_name: "")).to be_invalid
    end
    it "should not save if email already exists" do
      create(:user, :male)
      expect(build(:user)).to be_invalid
    end
    it "should not save if invalid email format" do
      expect(build(:user, email: "invalidEmail")).to be_invalid
    end
  end
  it "should be a valid product" do
    expect(build(:product, user: build(:user))).to be_valid
  end
  it "should also be valid" do
    expect(build(:user, :male).first_name).to eq("Jonathon")
    expect(build(:user, :female).first_name).to eq("Tess")
  end
end