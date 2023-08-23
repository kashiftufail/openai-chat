require "test_helper"

class OpenaiQueriesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @openai_query = openai_queries(:one)
  end

  test "should get index" do
    get openai_queries_url
    assert_response :success
  end

  test "should get new" do
    get new_openai_query_url
    assert_response :success
  end

  test "should create openai_query" do
    assert_difference("OpenaiQuery.count") do
      post openai_queries_url, params: { openai_query: { answer: @openai_query.answer, query: @openai_query.query, user_id: @openai_query.user_id } }
    end

    assert_redirected_to openai_query_url(OpenaiQuery.last)
  end

  test "should show openai_query" do
    get openai_query_url(@openai_query)
    assert_response :success
  end

  test "should get edit" do
    get edit_openai_query_url(@openai_query)
    assert_response :success
  end

  test "should update openai_query" do
    patch openai_query_url(@openai_query), params: { openai_query: { answer: @openai_query.answer, query: @openai_query.query, user_id: @openai_query.user_id } }
    assert_redirected_to openai_query_url(@openai_query)
  end

  test "should destroy openai_query" do
    assert_difference("OpenaiQuery.count", -1) do
      delete openai_query_url(@openai_query)
    end

    assert_redirected_to openai_queries_url
  end
end
