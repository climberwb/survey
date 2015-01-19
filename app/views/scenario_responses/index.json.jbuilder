json.array!(@scenario_responses) do |scenario_response|
  json.extract! scenario_response, :id, :duration, :survery_response, :scenario, :first_choice, :second_choice
  json.url scenario_response_url(scenario_response, format: :json)
end
