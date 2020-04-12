require 'rails_helper'

RSpec.describe Message, type: :model do
  context "invalid message created" do
    it "cant make a message without a message" do
      expect(build(:message, message:"")).to be_invalid
    end
    it "cant make a message without a user reference" do
      expect(build(:message, user:nil)).to be_invalid
    end
    it "cant make a message with a message less than 10 characters" do
      expect(build(:message, message:"jajjjjjjj")).to be_invalid
    end
  end
  context "make sure it takes valid inputs" do
    it "should create message" do
      expect(build(:message)).to be_valid
    end
  end
end
