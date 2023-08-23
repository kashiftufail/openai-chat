require "application_system_test_case"

class OpenaiQueriesTest < ApplicationSystemTestCase
  setup do
    @openai_query = openai_queries(:one)
  end

  test "visiting the index" do
    visit openai_queries_url
    assert_selector "h1", text: "Openai queries"
  end

  test "should create openai query" do
    visit openai_queries_url
    click_on "New openai query"

    fill_in "Answer", with: @openai_query.answer
    fill_in "Query", with: @openai_query.query
    fill_in "User", with: @openai_query.user_id
    click_on "Create Openai query"

    assert_text "Openai query was successfully created"
    click_on "Back"
  end

  test "should update Openai query" do
    visit openai_query_url(@openai_query)
    click_on "Edit this openai query", match: :first

    fill_in "Answer", with: @openai_query.answer
    fill_in "Query", with: @openai_query.query
    fill_in "User", with: @openai_query.user_id
    click_on "Update Openai query"

    assert_text "Openai query was successfully updated"
    click_on "Back"
  end

  test "should destroy Openai query" do
    visit openai_query_url(@openai_query)
    click_on "Destroy this openai query", match: :first

    assert_text "Openai query was successfully destroyed"
  end
end
