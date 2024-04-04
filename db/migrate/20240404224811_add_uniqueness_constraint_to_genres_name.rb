class AddUniquenessConstraintToGenresName < ActiveRecord::Migration[7.1]
  def change
    def change
      add_index :genres, :name, unique: true
    end
  end
end
