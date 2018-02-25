class CreateTraits < ActiveRecord::Migration[5.1]
  def change
    create_table :traits do |t|
    	t.string :trait_name
      	t.timestamps
    end
    add_index :traits, :trait_name, unique: true
  end
end
