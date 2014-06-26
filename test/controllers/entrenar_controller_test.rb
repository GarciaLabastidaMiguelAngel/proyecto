require 'test_helper'

class EntrenarControllerTest < ActionController::TestCase
  test "should get entrenar" do
    get :entrenar
    assert_response :success
  end

end
