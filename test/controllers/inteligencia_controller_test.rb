require 'test_helper'

class InteligenciaControllerTest < ActionController::TestCase
  test "should get duvas" do
    get :duvas
    assert_response :success
  end

end
