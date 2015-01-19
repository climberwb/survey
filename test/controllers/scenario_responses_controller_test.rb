require 'test_helper'

class ScenarioResponsesControllerTest < ActionController::TestCase
  setup do
    @scenario_response = scenario_responses(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:scenario_responses)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create scenario_response" do
    assert_difference('ScenarioResponse.count') do
      post :create, scenario_response: { duration: @scenario_response.duration, first_choice: @scenario_response.first_choice, scenario: @scenario_response.scenario, second_choice: @scenario_response.second_choice, survery_response: @scenario_response.survery_response }
    end

    assert_redirected_to scenario_response_path(assigns(:scenario_response))
  end

  test "should show scenario_response" do
    get :show, id: @scenario_response
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @scenario_response
    assert_response :success
  end

  test "should update scenario_response" do
    patch :update, id: @scenario_response, scenario_response: { duration: @scenario_response.duration, first_choice: @scenario_response.first_choice, scenario: @scenario_response.scenario, second_choice: @scenario_response.second_choice, survery_response: @scenario_response.survery_response }
    assert_redirected_to scenario_response_path(assigns(:scenario_response))
  end

  test "should destroy scenario_response" do
    assert_difference('ScenarioResponse.count', -1) do
      delete :destroy, id: @scenario_response
    end

    assert_redirected_to scenario_responses_path
  end
end
