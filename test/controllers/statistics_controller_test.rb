require 'test_helper'

class StatisticsControllerTest < ActionController::TestCase

  test "Admin should be able to view statistics" do
    sign_in users(:one)
    get :index
    assert_response :success
    assert_not_nil assigns(:users)
  end

  test "Member should not be able to view statistics" do
    sign_in users(:two)
    get :index
    assert_equal 'Access denied.', flash[:error]
    assert_redirected_to root_url
  end

  test "nregistered users should not be able to view statistics" do
    get :index
    assert_equal 'Access denied.', flash[:error]
    assert_redirected_to root_url
  end

end
