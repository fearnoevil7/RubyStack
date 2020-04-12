class CreateAlbumLikes < ActiveRecord::Migration[5.0]
  def change
    create_table :album_likes do |t|
      t.references :user, foreign_key: true
      t.references :album, foreign_key: true

      t.timestamps
    end
  end
end
