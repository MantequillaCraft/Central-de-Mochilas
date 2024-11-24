require "test_helper"

class ReserveOrPurchasesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @reserve_or_purchase = reserve_or_purchases(:one)
  end

  test "should get index" do
    get reserve_or_purchases_url
    assert_response :success
  end

  test "should get new" do
    get new_reserve_or_purchase_url
    assert_response :success
  end

  test "should create reserve_or_purchase" do
    assert_difference("ReserveOrPurchase.count") do
      post reserve_or_purchases_url, params: { reserve_or_purchase: { customer_id: @reserve_or_purchase.customer_id, desired_quantity: @reserve_or_purchase.desired_quantity, payment_method: @reserve_or_purchase.payment_method, product_id: @reserve_or_purchase.product_id } }
    end

    assert_redirected_to reserve_or_purchase_url(ReserveOrPurchase.last)
  end

  test "should show reserve_or_purchase" do
    get reserve_or_purchase_url(@reserve_or_purchase)
    assert_response :success
  end

  test "should get edit" do
    get edit_reserve_or_purchase_url(@reserve_or_purchase)
    assert_response :success
  end

  test "should update reserve_or_purchase" do
    patch reserve_or_purchase_url(@reserve_or_purchase), params: { reserve_or_purchase: { customer_id: @reserve_or_purchase.customer_id, desired_quantity: @reserve_or_purchase.desired_quantity, payment_method: @reserve_or_purchase.payment_method, product_id: @reserve_or_purchase.product_id } }
    assert_redirected_to reserve_or_purchase_url(@reserve_or_purchase)
  end

  test "should destroy reserve_or_purchase" do
    assert_difference("ReserveOrPurchase.count", -1) do
      delete reserve_or_purchase_url(@reserve_or_purchase)
    end

    assert_redirected_to reserve_or_purchases_url
  end
end
