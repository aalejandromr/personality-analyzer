class AddUserDatatoPersonalityAnalyze < ActiveRecord::Migration[5.1]
  def change
  	add_column :personality_analyzes, :user_data, :string, null: false
  end
end
