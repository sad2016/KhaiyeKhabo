require 'test_helper'

class UsersControllerTest < ActionController::TestCase
  setup do

  end

  test "Admin should be able to view index (list of all members)" do
    sign_in users(:one)
    get :index
    assert_response :success
    assert_not_nil assigns(:users)
  end

  test "Member should not be able to view index (list of all members)" do
    sign_in users(:two)
    get :index
    assert_equal 'Access denied.', flash[:error]
    assert_redirected_to root_url
  end

  test "Unregistered users should not be able to view index (list of all members)" do
    get :index
    assert_equal 'Access denied.', flash[:error]
    assert_redirected_to root_url
  end

  test "Admin should be able to view his/her profile" do
    @user = users(:one)
    sign_in users(:one)
    get :show, id: @user
    assert_response :success
  end

  test "Member should be able to view his/her profile" do
    @user = users(:two)
    sign_in users(:two)
    get :show, id: @user
    assert_response :success
  end

  test "Admin should be able to view other member's profile" do
    @user = users(:two)
    sign_in users(:one)
    get :show, id: @user
    assert_response :success
  end

  test "Member should be able to view other member's profile" do
    @user = users(:three)
    sign_in users(:two)
    get :show, id: @user
    assert_response :success
  end

  test "Unregistered users should not be able to view other member's profile" do
    @user = users(:three)
    get :show, id: @user
    assert_equal 'Access denied.', flash[:error]
    assert_redirected_to root_url
  end

  test "Admin should be able to view other admin's profile" do
    @user = users(:four)
    sign_in users(:one)
    get :show, id: @user
    assert_response :success
  end

  test "Member should be able to view other admin's profile" do
    @user = users(:four)
    sign_in users(:two)
    get :show, id: @user
    assert_response :success
  end

  test "Unregistered users should not be able to view other admin's profile" do
    @user = users(:four)
    get :show, id: @user
    assert_equal 'Access denied.', flash[:error]
    assert_redirected_to root_url
  end




  test "Admin should be able to edit his/her profile" do
    @user = users(:one)
    sign_in users(:one)
    get :edit, id: @user
    assert_response :success
  end

  test "Member should be able to edit his/her profile" do
    @user = users(:two)
    sign_in users(:two)
    get :edit, id: @user
    assert_response :success
  end

  test "Admin should be able to edit other member's profile" do
    @user = users(:two)
    sign_in users(:one)
    get :edit, id: @user
    assert_response :success
  end

  test "Member should not be able to edit other member's profile" do
    @user = users(:three)
    sign_in users(:two)
    get :edit, id: @user
    assert_equal 'Access denied.', flash[:error]
    assert_redirected_to root_url
  end

  test "Unregistered users should not be able to edit other member's profile" do
    @user = users(:three)
    get :edit, id: @user
    assert_equal 'Access denied.', flash[:error]
    assert_redirected_to root_url
  end

  test "Admin should be able to edit other admin's profile" do
    @user = users(:four)
    sign_in users(:one)
    get :edit, id: @user
    assert_response :success
  end

  test "Member should not be able to edit other admin's profile" do
    @user = users(:four)
    sign_in users(:two)
    get :edit, id: @user
    assert_equal 'Access denied.', flash[:error]
    assert_redirected_to root_url
  end

  test "Unregisterd users should not be able to edit other admin's profile" do
    @user = users(:four)
    get :edit, id: @user
    assert_equal 'Access denied.', flash[:error]
    assert_redirected_to root_url
  end




  test "Admin should be able to update his/her profile" do
    @user = users(:one)
    sign_in users(:one)
    patch :update, id: @user, user: { role_id: @user.role_id }
    assert_redirected_to user_path(assigns(:user))
  end

  test "Member should be able to update his/her profile" do
    @user = users(:two)
    sign_in users(:two)
    patch :update, id: @user, user: { role_id: @user.role_id }
    assert_redirected_to user_path(assigns(:user))
  end

  test "Admin should be able to update other member's profile" do
    @user = users(:two)
    sign_in users(:one)
    patch :update, id: @user, user: { role_id: @user.role_id }
    assert_redirected_to user_path(assigns(:user))
  end

  test "Member should not be able to update other member's profile" do
    @user = users(:three)
    sign_in users(:two)
    patch :update, id: @user, user: { role_id: @user.role_id }
    assert_equal 'Access denied.', flash[:error]
    assert_redirected_to root_url
  end

  test "Unregistered users should not be able to update other member's profile" do
    @user = users(:three)
    patch :update, id: @user, user: { role_id: @user.role_id }
    assert_equal 'Access denied.', flash[:error]
    assert_redirected_to root_url
  end

  test "Admin should be able to update other admin's profile" do
    @user = users(:four)
    sign_in users(:one)
    patch :update, id: @user, user: { role_id: @user.role_id }
    assert_redirected_to user_path(assigns(:user))
  end

  test "Member should not be able to update other admin's profile" do
    @user = users(:one)
    sign_in users(:two)
    patch :update, id: @user, user: { role_id: @user.role_id }
    assert_equal 'Access denied.', flash[:error]
    assert_redirected_to root_url
  end

  test "Unregistered users should not be able to update other admin's profile" do
    @user = users(:four)
    patch :update, id: @user, user: { role_id: @user.role_id }
    assert_equal 'Access denied.', flash[:error]
    assert_redirected_to root_url
  end



  test "Admin should be able to ban other admin" do
    @user = users(:four)
    sign_in users(:one)
    patch :update, id: @user, user: { isbanned: true }
    assert_redirected_to user_path(assigns(:user))
  end

  test "Member should not be able to ban other admin" do
    @user = users(:four)
    sign_in users(:two)
    patch :update, id: @user, user: { isbanned: true }
    assert_equal 'Access denied.', flash[:error]
    assert_redirected_to root_url
  end

  test "Unregistered users should not be able to ban other admin" do
    @user = users(:four)
    patch :update, id: @user, user: { isbanned: true }
    assert_equal 'Access denied.', flash[:error]
    assert_redirected_to root_url
  end

  test "Admin should be able to ban other member" do
    @user = users(:two)
    sign_in users(:one)
    patch :update, id: @user, user: { isbanned: true }
    assert_redirected_to user_path(assigns(:user))
  end

  test "Member should not be able to ban other member" do
    @user = users(:three)
    sign_in users(:two)
    patch :update, id: @user, user: { isbanned: true }
    assert_equal 'Access denied.', flash[:error]
    assert_redirected_to root_url
  end


  test "Unregistered users should not be able to ban other member" do
    @user = users(:three)
    patch :update, id: @user, user: { isbanned: true }
    assert_equal 'Access denied.', flash[:error]
    assert_redirected_to root_url
  end

end
