class SurveyResponse < ActiveRecord::Base

  has_many :scenario_responses
  accepts_nested_attributes_for :scenario_responses

# preferred_choice_with_count
# preferred_choices_with_counts
# preferred_choices_with_counts["Dark"]

  def preferred_choice(int)
    sr_resps = scenario_responses.each_with_object(Hash.new {|h,k|h[k] = []}) do |sr, h|
      h[0] << sr.first_choice
      h[1] << sr.second_choice
      last = (0..2).to_a
      last.delete(sr.first_choice)
      last.delete(sr.second_choice)
      h[2] << last.first
    end
    choice = sr_resps[int].max_by {|i| sr_resps[int].count(i)}
    case choice
    when 0 then "Milk"
    when 1 then "Dark"
    when 2 then "No Purchase"
    end
  end
 
  class << self
    def preferred_choices(int)
      SurveyResponse.includes(:scenario_responses).all.map do |surv|
        surv.preferred_choice(int)
      end
    end

    def preferred_choice(int)
      pf = preferred_choices(int)
      pf.max_by {|x| pf.count(x)}
    end

    def preferred_choices_with_counts(int)
      preferred_choices(int).each_with_object(Hash.new(0)) do |pf, h|
        h[pf] += 1
      end
    end

    def preferred_choice_with_count(int)
      preferred_choices_with_counts(int).max_by{|k,v| v}
    end

    # def most_popular_first_choice
    #   SurveyResponse.includes(:scenario_responses).all.map do |surv|
    #     [surv, surv.preferred_choice(0)]
    #   end
        # "most popular first option for all surveys(display survey number)"

        #   first choice         second choice    third choice
      #   ["dark"  "milk" "milk"]       ["dark"]   ["none"]
      # people who prefer dark: 10
      # people who prefer milk: 11
      # people who have no preference: 4
      # people who don't want chocolate: 0
    # end
    # def respondent_preferences
    #   SurveyResponse.includes(:scenario_responses).all.map do |surv|# .each_with_object(Hash.new(0)) do |surv, hash|
    #     sr_resps = surv.scenario_responses.each_with_object(Hash.new {|h,k|h[k] = []}) do |sr, h|
    #       h[:first_choice] << sr.first_choice
    #       h[:second_choice] << sr.second_choice 
    #     end
    #     p sr_resps
    #     fc = sr_resps[:first_choice].max_by {|i| sr_resps[:first_choice].count(i)}
    #     case fc
    #     when 0 then "Milk"
    #     when 1 then "Dark"
    #     else
    #       "No Purchase"
    #     end
    #   end

    # end
  end
end