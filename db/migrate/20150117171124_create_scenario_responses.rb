class CreateScenarioResponses < ActiveRecord::Migration
  def change
    create_table :scenario_responses do |t|
      t.integer :duration, :null => false 
      t.references :survey_response, :null => false 
      t.integer :scenario, :null => false 
      t.integer :first_choice, :null => false 
      t.integer :second_choice, :null => false 

      t.timestamps
    end
      add_foreign_key :scenario_responses, :survey_responses
  end
end
