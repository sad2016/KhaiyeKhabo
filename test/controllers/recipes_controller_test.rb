require 'test_helper'

class RecipesControllerTest < ActionController::TestCase
  setup do


  end
  test "Admin should be able to view index (list of all recipes)" do
    @recipe = recipes(:one)

    sign_in users(:one)
    get :index
    assert_response :success
    assert_not_nil assigns(:recipes)
  end

  test "Member should be able to view index (list of all recipes)" do
    @recipe = recipes(:one)

    sign_in users(:two)
    get :index
    assert_response :success
    assert_not_nil assigns(:recipes)
  end

  test "Unregistered users should be able to view index (list of all recipes)" do
    @recipe = recipes(:one)

    get :index
    assert_response :success
    assert_not_nil assigns(:recipes)
  end




  test "Admin should be able to view his/her recipe list" do

    sign_in users(:one)
    get :myrecipe
    assert_response :success
  end

  test "Member should be able to view his/her recipe list" do

    sign_in users(:two)
    get :myrecipe
    assert_response :success
  end

  test "Unregistered users should not be able to view his/her recipe list" do
    get :myrecipe

    assert_equal 'Access denied.', flash[:error]
    assert_redirected_to root_url
  end


  test "Admin should be able to edit his/her own recipe" do
    @recipe = recipes(:one)
    sign_in users(:one)
    get :edit, id: @recipe
    assert_response :success
  end

  test "Member should be able to edit his/her own recipe" do
    @recipe = recipes(:two)
    sign_in users(:two)
    get :edit, id: @recipe
    assert_response :success
  end

  test "Admin should be able to edit other member's recipe" do
    @recipe = recipes(:two)
    sign_in users(:one)
    get :edit, id: @recipe
    assert_response :success
  end

  test "Member should not be able to edit other member's recipe" do
    @recipe = recipes(:one)
    sign_in users(:two)
    get :edit, id: @recipe
    assert_equal 'Access denied.', flash[:error]
    assert_redirected_to root_url
  end

  test "Unregistered users should not be able to edit other member's recipe" do
    @recipe = recipes(:one)
    get :edit, id: @recipe
    assert_equal 'Access denied.', flash[:error]
    assert_redirected_to root_url
  end




  test "Admin should be able to create a recipe" do
    @recipe = recipes(:one)
    sign_in users(:one)
      assert_difference('Recipe.count') do
      post :create, recipe: { cooktime: @recipe.cooktime, description: @recipe.description, directions: @recipe.directions, ingredients: @recipe.ingredients, preptime: @recipe.preptime, servings: @recipe.servings, title: @recipe.title, user_id: @recipe.user_id }
    end

    assert_redirected_to recipe_path(assigns(:recipe))
  end

  test "Member should be able to create a recipe" do
    @recipe = recipes(:one)
    sign_in users(:two)
    assert_difference('Recipe.count') do
      post :create, recipe: { cooktime: @recipe.cooktime, description: @recipe.description, directions: @recipe.directions, ingredients: @recipe.ingredients, preptime: @recipe.preptime, servings: @recipe.servings, title: @recipe.title, user_id: @recipe.user_id }
    end

    assert_redirected_to recipe_path(assigns(:recipe))
  end

  test "Unregistered user not should be able to create a recipe" do
    @recipe = recipes(:one)
    assert_difference('Recipe.count',0) do
      post :create, recipe: { cooktime: @recipe.cooktime, description: @recipe.description, directions: @recipe.directions, ingredients: @recipe.ingredients, preptime: @recipe.preptime, servings: @recipe.servings, title: @recipe.title, user_id: @recipe.user_id }
    end
    assert_equal 'Access denied.', flash[:error]
    assert_redirected_to root_url
  end

  test "Admin should be able to destroy his/her own recipe" do
    @recipe = recipes(:one)

    sign_in users(:one)
    assert_difference('Recipe.count', -1) do
      delete :destroy, id: @recipe
    end

    assert_redirected_to recipes_path
  end

  test "Member should be able to destroy his/her own recipe" do
    @recipe = recipes(:two)

    sign_in users(:two)
    assert_difference('Recipe.count', -1) do
      delete :destroy, id: @recipe
    end

    assert_redirected_to recipes_path
  end
  test "Admin should be able to destroy other's recipe" do
    @recipe = recipes(:two)

    sign_in users(:one)
    assert_difference('Recipe.count', -1) do
      delete :destroy, id: @recipe
    end

    assert_redirected_to recipes_path
  end

  test "Member should not be able to destroy other's recipe" do
    @recipe = recipes(:one)

    sign_in users(:two)
    assert_difference('Recipe.count', 0) do
      delete :destroy, id: @recipe
    end
    assert_equal 'Access denied.', flash[:error]
    assert_redirected_to root_url
  end

  test "Unregistered user should not be able to destroy a recipe" do
    @recipe = recipes(:one)

    assert_difference('Recipe.count', 0) do
      delete :destroy, id: @recipe
    end
    assert_equal 'Access denied.', flash[:error]
    assert_redirected_to root_url
  end


end
