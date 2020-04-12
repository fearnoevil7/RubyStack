require 'rails_helper'

RSpec.describe Comment, type: :model do
  context "invalid comment cannot be created" do
    it "cant make a comment without a comment" do
      expect(build(:comment, comment:"")).to be_invalid
    end
    it "cant make a message without a message reference" do
      expect(build(:comment, message:nil)).to be_invalid
    end
    it "cant make a comment without a user reference" do
      expect(build(:comment, user:nil)).to be_invalid
    end
  end
  it "cant make a comment with a comment less than 10 characters" do
    expect(build(:comment, comment:"abcdrjjkl")).to be_invalid
  end
  context "make sure it takes valid inputs" do
    it "should create a comment" do
      expect(build(:comment)).to be_valid
    end
  end
end
