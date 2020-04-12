require 'rails_helper'

RSpec.describe ReviewLike, type: :model do
  it 'requires content' do
    expect(build:review, content: '').to be_invalid
  end

  context 'relationships' do
    before do
      @user = create(:user)
      @album = create(:album, user:@user)
      @review = create(:review, user:@user, album:@album)
      @albumLike = create(:albumLike, user:@user, album:@album)
      @reviewLike = create(:reviewLike, user:@user, album:@album)
    end
    it 'review was written by a user' do
      expect(@review.user).to include(@user)
    end
    it 'review belongs to a album' do
      expect(@review.album).to include(@album)
    end
    it 'review has likes' do
      expect(@review.reviewLikes).to include(@reviewLike)
    end
    it 'has users through the likes table' do
      expect(@review.users_who_agree).to include(@user)
    end
  end
end
