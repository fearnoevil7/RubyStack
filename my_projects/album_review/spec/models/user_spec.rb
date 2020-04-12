require 'rails_helper'

RSpec.describe User, type: :model do
  context "With valid attributes" do
    expect(build(:user)).to be_invalid
  end

  context "With invalid attributes" do
    it "should not save if first_name field is blank" do
      expect(build(:user, first_name: '')).to be_invalid
    end
    it "should not save if last_name field is blank" do
      expect(build(:user, last_name: '')).to be_invalid
    end
    it "should not save if email already exists" do
      create(:user)
      expect(build(:user)).to be_invalid
    end
    it "should contain a valid email" do
      expect(build(:user, email: 'jonsong94yahoo.com')).to be_invalid
    end
    it "should not save if password is invalid" do
      expect(build(:user, password:'cat')).to be_invalid
    end
    it "should have matching password and confirmation" do
      expect(build(:user, password_confirmation:'notpassword')).to be_invalid
    end
    
    context 'relationships between reviews' do
      before do
        @user = create(:user)
        @album = create(:album, user:@user)
        @review = create(:review, user:@user, album:@album)
        @reviewLike = create(:reviewLike, user:@user, review:@review)
        @albumLike = create(:albumLike, user:@user, album:@album)
      end
      it 'has album uploaded' do
        expect(@user.albums).to include(@album)
      end
      it 'album has reviews' do
        expect(@album.reviews).to include(@review)
      end
      it "has albums through the review table" do
        expect(@user.albums_reviewed).to include(@album)
      end
      it "review has likes" do
        expect(@review.reviewLikes).to include(@reviewLike)
      end
      it "album has likes" do
        expect(@album.albumLikes).to include(@albumLike)
      end
      it "has albums through the likes table" do
        expect(@user.albums_liked).to include(@album)
      end
      it "has reviews through the likes table" do
        expect(@user.reviews_liked).to include(@review)
      end
    end
  end
end
