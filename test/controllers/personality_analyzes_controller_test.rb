require 'test_helper'

class PersonalityAnalyzesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @personality_analyze = personality_analyzes(:one)
  end

  test "should get index" do
    get personality_analyzes_url
    assert_response :success
  end

  test "should get new" do
    get new_personality_analyze_url
    assert_response :success
  end

  test "should create personality_analyze" do
    assert_difference('PersonalityAnalyze.count') do
      post personality_analyzes_url, params: { personality_analyze: {  } }
    end

    assert_redirected_to personality_analyze_url(PersonalityAnalyze.last)
  end

  test "should show personality_analyze" do
    get personality_analyze_url(@personality_analyze)
    assert_response :success
  end

  test "should get edit" do
    get edit_personality_analyze_url(@personality_analyze)
    assert_response :success
  end

  test "should update personality_analyze" do
    patch personality_analyze_url(@personality_analyze), params: { personality_analyze: {  } }
    assert_redirected_to personality_analyze_url(@personality_analyze)
  end

  test "should destroy personality_analyze" do
    assert_difference('PersonalityAnalyze.count', -1) do
      delete personality_analyze_url(@personality_analyze)
    end

    assert_redirected_to personality_analyzes_url
  end
end
