require "test_helper"

class SalesReportsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get sales_reports_index_url
    assert_response :success
  end
end
