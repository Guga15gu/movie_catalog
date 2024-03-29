class AddFavoriteGenreRefToDirectors < ActiveRecord::Migration[7.1]
  def change
    add_reference :directors, :favorite_genre, null: false, foreign_key: { to_table: :genres }
  end
end
