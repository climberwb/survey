class ScenarioResponse < ActiveRecord::Base
  belongs_to :survey_response
  
    SCENARIOS = [
    ['Milk, Chewy, No Nuts, 3.99', 'Dark, Soft, Nuts, 5.99', 'No Purchase'],
    ['Milk, Chewy, Nuts, 3.99',   'Dark, Soft, No Nuts, 4.99', 'No Purchase'],
    ['Milk, Soft, No Nuts, 5.99', 'Dark, Chewy, Nuts, 3.99', 'No Purchase'],
    ['Milk, Soft, No Nuts, 4.99', 'Dark, Chewy, No Nuts, 5.99', 'No Purchase']
  ].map do |arr|
      arr.each_with_index.map.to_a
    end
end

# "Milky, chewey, and nut free for $3.99"
# "No Purchase"
# "Milky, Hard, and nut free for $3.99"


