class AddGenreToSongs < ActiveRecord::Migration[5.1]
  def change
    add_column :songs, :genre, :string
  end
end
