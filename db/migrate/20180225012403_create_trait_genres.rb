class CreateTraitGenres < ActiveRecord::Migration[5.1]
  def change
    create_table :trait_genres do |t|
    	t.bigint :trait_id
    	t.bigint :genre_id
      t.timestamps
    end

    change_column :traits, :trait_name, :string, null: false
	add_foreign_key :trait_genres, :traits
	add_foreign_key :trait_genres, :genres
  end
end
