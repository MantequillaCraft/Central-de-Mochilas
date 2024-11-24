require "test_helper"

class ChangeHistoriesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @change_history = change_histories(:one)
  end

  test "should get index" do
    get change_histories_url
    assert_response :success
  end

  test "should get new" do
    get new_change_history_url
    assert_response :success
  end

  test "should create change_history" do
    assert_difference("ChangeHistory.count") do
      post change_histories_url, params: { change_history: { change_description: @change_history.change_description, modification_date: @change_history.modification_date, product_id: @change_history.product_id } }
    end

    assert_redirected_to change_history_url(ChangeHistory.last)
  end

  test "should show change_history" do
    get change_history_url(@change_history)
    assert_response :success
  end

  test "should get edit" do
    get edit_change_history_url(@change_history)
    assert_response :success
  end

  test "should update change_history" do
    patch change_history_url(@change_history), params: { change_history: { change_description: @change_history.change_description, modification_date: @change_history.modification_date, product_id: @change_history.product_id } }
    assert_redirected_to change_history_url(@change_history)
  end

  test "should destroy change_history" do
    assert_difference("ChangeHistory.count", -1) do
      delete change_history_url(@change_history)
    end

    assert_redirected_to change_histories_url
  end
end
