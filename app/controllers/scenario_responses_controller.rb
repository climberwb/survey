class ScenarioResponsesController < ApplicationController
  before_action :set_scenario_response, only: [:show, :edit, :update, :destroy]

  # GET /scenario_responses
  # GET /scenario_responses.json
  def index
    @scenario_responses = ScenarioResponse.all
  end

  # GET /scenario_responses/1
  # GET /scenario_responses/1.json
  def show

  end

  # GET /scenario_responses/new
  def new
    @survey_response = SurveyResponse.new
    @scenario_response = ScenarioResponse.new
    @scenarios = [
  [['"Milk", "Chewy", "No Nuts", 3.99',1], ['"Dark", "Soft", "Nuts", 5.99',2], ["No Purchase",3],
  ['"Milk", "Chewy", "Nuts", 3.99',1],   ['"Dark", "Soft", "No Nuts", 4.99',2], ["No Purchase",3],
  ['"Milk", "Soft", "No Nuts", 5.99',1], ['"Dark", "Chewy", "Nuts", 3.99',2], ["No Purchase",3],
  ['"Milk", "Soft", "No Nuts", 4.99',1], ['"Dark", "Chewy", "No Nuts", 5.99',2], ["No Purchase",3]
]
   
  end

  # GET /scenario_responses/1/edit
  def edit
  end

  # POST /scenario_responses
  # POST /scenario_responses.json
  def create
    @survey_response = SurveyResponse.new
    @scenario_response = ScenarioResponse.new(scenario_response_params)



    respond_to do |format|
        if @survey_response.save
          if @scenario_response.save
            format.html { redirect_to @scenario_response, notice: 'Scenario response was successfully created.' }
            format.json { render :show, status: :created, location: @scenario_response }
          else
            format.html { render :new }
            format.json { render json: @scenario_response.errors, status: :unprocessable_entity }
          end
        end
    end
  end

  # PATCH/PUT /scenario_responses/1
  # PATCH/PUT /scenario_responses/1.json
  def update
    respond_to do |format|
      if @scenario_response.update(scenario_response_params)
        format.html { redirect_to @scenario_response, notice: 'Scenario response was successfully updated.' }
        format.json { render :show, status: :ok, location: @scenario_response }
      else
        format.html { render :edit }
        format.json { render json: @scenario_response.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /scenario_responses/1
  # DELETE /scenario_responses/1.json
  def destroy
    @scenario_response.destroy
    respond_to do |format|
      format.html { redirect_to scenario_responses_url, notice: 'Scenario response was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_scenario_response
      @scenario_response = ScenarioResponse.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def scenario_response_params
      params.require(:scenario_response).permit(:duration, :survery_response, :scenario, :first_choice, :second_choice)
    end
end
