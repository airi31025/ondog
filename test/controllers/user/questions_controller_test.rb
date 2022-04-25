require "test_helper"

class User::QuestionsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get user_questions_index_url
    assert_response :success
  end

  test "should get practice" do
    get user_questions_practice_url
    assert_response :success
  end

  test "should get test" do
    get user_questions_test_url
    assert_response :success
  end
end
