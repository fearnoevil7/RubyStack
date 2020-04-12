require 'rails_helper'

RSpec.describe Album, type: :model do
  it 'requires title' do
    expect(build(:album, title: '')).to be_invalid
  end
  it 'requires author' do
    expect(build(:album, author: '')).to be_invalid
  end

  context 'relationships' do
    before do
      @user = create(:user)
      @album = create(:album, user:@user)
      @review = create(:review, user:@user, album:@album)
      @albumLike = create(:albumLike, user:@user, album:@album)
      @reviewLike = create(:reviewLike, user:@user, album:@album)
    end
    it 'album belongs to a user' do
      expect(@album.user).to eq(@user)
    end
    it 'album has likes' do
      expect(@album.albumLikes).to include(@albumLike)
    end
    it 'album has reviews' do
      expect(@album.reviews).to include(@review)
    end
    it 'has users through the AlbumLike table' do
      expect(@album.users_who_like).to include(@user)
    end
    it 'has users through the Review table' do
      expect(@album.users_who_reviewed).to include(@user)
    end
end
