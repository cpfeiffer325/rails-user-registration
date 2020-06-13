require 'test_helper'

class ConfirmControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get confirm_index_url
    assert_response :success
  end

end
