require 'test_helper'

class CookcategoriesControllerTest < ActionController::TestCase
  setup do
    @cookcategory = cookcategories(:one)
  end

  test "Admin should be able to view the categories" do
    sign_in users(:one)
    get :index
    assert_response :success
    assert_not_nil assigns(:cookcategories)
  end

  test "Member should be able to view the categories" do
    sign_in users(:two)
    get :index
    assert_response :success
    assert_not_nil assigns(:cookcategories)
  end

  test "Unregistered users should be able to view the categories" do
    get :index
    assert_response :success
    assert_not_nil assigns(:cookcategories)
  end

  test "Admin should be able to get new category" do
    sign_in users(:one)
    get :new
    assert_response :success
  end

  test "Member should not be able to get new category" do
    sign_in users(:two)
    get :new
    assert_equal 'Access denied.', flash[:error]
    assert_redirected_to root_url
  end

  test "Unregistered user should not be able to get new category" do
    get :new
    assert_equal 'Access denied.', flash[:error]
    assert_redirected_to root_url
  end

  test "Admin should be able to create a cook category" do
    sign_in users(:one)
    assert_difference('Cookcategory.count') do
      post :create, cookcategory: { name: @cookcategory.name }
    end

    assert_redirected_to cookcategory_path(assigns(:cookcategory))
  end

  test "Member should not be able to create a cook category" do
    sign_in users(:two)
    assert_difference('Cookcategory.count',0) do
      post :create, cookcategory: { name: @cookcategory.name }
    end
    assert_equal 'Access denied.', flash[:error]
    assert_redirected_to root_url
  end

  test "Unregistered user not should be able to create a cook category" do
    assert_difference('Cookcategory.count',0) do
      post :create, cookcategory: { name: @cookcategory.name }
    end
    assert_equal 'Access denied.', flash[:error]
    assert_redirected_to root_url
  end


  test "Admin should be able to edit a cook category" do
    sign_in users(:one)
    get :edit, id: @cookcategory
    assert_response :success
  end

  test "Member should not be able to edit a cook category" do
    sign_in users(:two)
    get :edit, id: @cookcategory
    assert_equal 'Access denied.', flash[:error]
    assert_redirected_to root_url
  end

  test "Unregistered user not should be able to edit a cook category" do
    get :edit, id: @cookcategory
    assert_equal 'Access denied.', flash[:error]
    assert_redirected_to root_url
  end

  test "Admin should be able to update a cook category" do
    sign_in users(:one)
    patch :update, id: @cookcategory, cookcategory: { name: @cookcategory.name }
    assert_redirected_to cookcategory_path(assigns(:cookcategory))
  end

  test "Member should not be able to update a cook category" do
    sign_in users(:two)
    patch :update, id: @cookcategory, cookcategory: { name: @cookcategory.name }
    assert_equal 'Access denied.', flash[:error]
    assert_redirected_to root_url
  end

  test "Unregistered user should not be able to update a cook category" do
    patch :update, id: @cookcategory, cookcategory: { name: @cookcategory.name }
    assert_equal 'Access denied.', flash[:error]
    assert_redirected_to root_url
  end

  test "Admin should be able to destroy a cook category" do
    sign_in users(:one)
    assert_difference('Cookcategory.count', -1) do
      delete :destroy, id: @cookcategory
    end
    assert_redirected_to cookcategories_path
  end

  test "Member should not be able to destroy a cook category" do
    sign_in users(:two)
    assert_difference('Cookcategory.count', 0) do
      delete :destroy, id: @cookcategory
    end
    assert_equal 'Access denied.', flash[:error]
    assert_redirected_to root_url
  end

  test "Unregistered user should not be able to destroy a cook category" do
    assert_difference('Cookcategory.count', 0) do
      delete :destroy, id: @cookcategory
    end
    assert_equal 'Access denied.', flash[:error]
    assert_redirected_to root_url
  end

end
