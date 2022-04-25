require "test_helper"

class User::AnswerResultsControllerTest < ActionDispatch::IntegrationTest
  test "should get congrats" do
    get user_answer_results_congrats_url
    assert_response :success
  end
end
