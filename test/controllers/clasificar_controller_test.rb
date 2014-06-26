require 'test_helper'

class ClasificarControllerTest < ActionController::TestCase
  test "should get clasificar" do
    get :clasificar
    assert_response :success
  end

end
