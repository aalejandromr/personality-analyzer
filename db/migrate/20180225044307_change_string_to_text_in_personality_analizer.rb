class ChangeStringToTextInPersonalityAnalizer < ActiveRecord::Migration[5.1]
  def change
  	change_column :personality_analyzes, :user_data, :text, null: false
  end
end
