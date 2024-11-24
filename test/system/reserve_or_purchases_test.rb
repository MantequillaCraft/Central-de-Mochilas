require "application_system_test_case"

class ReserveOrPurchasesTest < ApplicationSystemTestCase
  setup do
    @reserve_or_purchase = reserve_or_purchases(:one)
  end

  test "visiting the index" do
    visit reserve_or_purchases_url
    assert_selector "h1", text: "Reserve or purchases"
  end

  test "should create reserve or purchase" do
    visit reserve_or_purchases_url
    click_on "New reserve or purchase"

    fill_in "Customer", with: @reserve_or_purchase.customer_id
    fill_in "Desired quantity", with: @reserve_or_purchase.desired_quantity
    fill_in "Payment method", with: @reserve_or_purchase.payment_method
    fill_in "Product", with: @reserve_or_purchase.product_id
    click_on "Create Reserve or purchase"

    assert_text "Reserve or purchase was successfully created"
    click_on "Back"
  end

  test "should update Reserve or purchase" do
    visit reserve_or_purchase_url(@reserve_or_purchase)
    click_on "Edit this reserve or purchase", match: :first

    fill_in "Customer", with: @reserve_or_purchase.customer_id
    fill_in "Desired quantity", with: @reserve_or_purchase.desired_quantity
    fill_in "Payment method", with: @reserve_or_purchase.payment_method
    fill_in "Product", with: @reserve_or_purchase.product_id
    click_on "Update Reserve or purchase"

    assert_text "Reserve or purchase was successfully updated"
    click_on "Back"
  end

  test "should destroy Reserve or purchase" do
    visit reserve_or_purchase_url(@reserve_or_purchase)
    click_on "Destroy this reserve or purchase", match: :first

    assert_text "Reserve or purchase was successfully destroyed"
  end
end
