class SurveyResponsesController < ApplicationController
  before_action :set_survey_response, only: [:show, :edit, :update, :destroy]

  # GET /survey_responses
  # GET /survey_responses.json
  def index
    @survey_responses = SurveyResponse.all
    @first_choice = SurveyResponse.preferred_choice_with_count(0)
    @second_choice = SurveyResponse.preferred_choice_with_count(1)
    @third_choice = SurveyResponse.preferred_choice_with_count(2)
    preferred_choices_with_counts = SurveyResponse.preferred_choices_with_counts(0)
    @dark_chocolate_count = preferred_choices_with_counts["Dark"]
    @milk_chocolate_count = preferred_choices_with_counts["Milk"]
    @no_purchase_count = preferred_choices_with_counts["No Purchase"]
  end

  # GET /survey_responses/1
  # GET /survey_responses/1.json
  def show
  end

  # GET /survey_responses/new
  def new
    @survey_response = SurveyResponse.new
    # ScenarioResponse::SCENARIOS[i]
    (0..3).to_a.shuffle.each do |i|
      @survey_response.scenario_responses << ScenarioResponse.new({scenario: i, duration: rand(100) })
   end

    @survey_response.scenario_responses.to_a.shuffle!
  end

  # GET /survey_responses/1/edit
  def edit
  end

  # POST /survey_responses
  # POST /survey_responses.json
  def create

    @survey_response = SurveyResponse.new(survey_response_params)

    respond_to do |format|
      if @survey_response.save
        format.html { redirect_to survey_responses_path, notice: 'Survey response was successfully created.' }
        format.json { render :index, status: :created, location: @survey_response }
      else
        format.html { render :new }
        format.json { render json: @survey_response.errors, status: :unprocessable_entity }
      end
    end
     
  end

  # PATCH/PUT /survey_responses/1
  # PATCH/PUT /survey_responses/1.json
  def update
    respond_to do |format|
      if @survey_response.update(survey_response_params)
        format.html { redirect_to @survey_response, notice: 'Survey response was successfully updated.' }
        format.json { render :show, status: :ok, location: @survey_response }
      else
        format.html { render :edit }
        format.json { render json: @survey_response.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /survey_responses/1
  # DELETE /survey_responses/1.json
  def destroy
    @survey_response.destroy
    respond_to do |format|
      format.html { redirect_to survey_responses_url, notice: 'Survey response was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_survey_response
      @survey_response = SurveyResponse.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def survey_response_params
      params.require(:survey_response).permit!
      # (:scenario_responses_attributes)
     #params.require(:topic).permit(:name, :description, :public, :image)
    end
end

# => {"utf8"=>"✓",
#  "authenticity_token"=>"x0CY710oxo3nRExC/Xmw7I+pM+sMcWNZfHU72GBg3x0=",
#  "survey_response"=>
#   {"scenario_responses_attributes"=>
#     {"0"=>
#       {"duration"=>"1", "scenario"=>"1", "first_choice"=>"1", "second_choice"=>"1"}}},
#  "commit"=>"Create Survey response",
#  "action"=>"create",
#  "controller"=>"survey_responses"}
