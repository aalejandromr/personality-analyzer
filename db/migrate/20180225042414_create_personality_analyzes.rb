class CreatePersonalityAnalyzes < ActiveRecord::Migration[5.1]
  def change
    create_table :personality_analyzes do |t|
    	t.bigint :user_id
      t.timestamps
    end
    add_foreign_key :personality_analyzes, :users
  end
end
