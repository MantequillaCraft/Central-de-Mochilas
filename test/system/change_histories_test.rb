require "application_system_test_case"

class ChangeHistoriesTest < ApplicationSystemTestCase
  setup do
    @change_history = change_histories(:one)
  end

  test "visiting the index" do
    visit change_histories_url
    assert_selector "h1", text: "Change histories"
  end

  test "should create change history" do
    visit change_histories_url
    click_on "New change history"

    fill_in "Change description", with: @change_history.change_description
    fill_in "Modification date", with: @change_history.modification_date
    fill_in "Product", with: @change_history.product_id
    click_on "Create Change history"

    assert_text "Change history was successfully created"
    click_on "Back"
  end

  test "should update Change history" do
    visit change_history_url(@change_history)
    click_on "Edit this change history", match: :first

    fill_in "Change description", with: @change_history.change_description
    fill_in "Modification date", with: @change_history.modification_date
    fill_in "Product", with: @change_history.product_id
    click_on "Update Change history"

    assert_text "Change history was successfully updated"
    click_on "Back"
  end

  test "should destroy Change history" do
    visit change_history_url(@change_history)
    click_on "Destroy this change history", match: :first

    assert_text "Change history was successfully destroyed"
  end
end
