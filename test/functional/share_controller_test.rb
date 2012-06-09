require 'test_helper'

class ShareControllerTest < ActionController::TestCase
  test "should get publish" do
    get :publish
    assert_response :success
  end

end
