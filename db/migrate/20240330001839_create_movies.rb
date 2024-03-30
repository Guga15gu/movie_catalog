class CreateMovies < ActiveRecord::Migration[7.1]
  def change
    create_table :movies do |t|
      t.string :title
      t.string :year
      t.string :summary
      t.string :country
      t.integer :duration

      t.references :director
      t.references :genre

      t.timestamps
    end
  end
end
