require 'test_helper'

class CommentsControllerTest < ActionController::TestCase
  setup do
    @recipe = recipes(:one)

  end



  test "Admin should be able to add a comment" do
    @comment = comments(:one)
    sign_in users(:one)
    assert_difference('Comment.count') do
      post :create, comment: { content: @comment.content, recipe_id: @comment.recipe_id, user_id: @comment.user_id }
    end

    assert_redirected_to recipe_path(@recipe.id)
  end

  test "Member should be able to add a comment" do
    @comment = comments(:two)
    sign_in users(:two)
    assert_difference('Comment.count') do
      post :create, comment: { content: @comment.content, recipe_id: @comment.recipe_id, user_id: @comment.user_id }
    end

    assert_redirected_to recipe_path(@recipe.id)
  end

  test "Unregistered user not should be able to add a comment" do
    @comment = comments(:three)
    assert_difference('Comment.count',0) do
      post :create, comment: { content: @comment.content, recipe_id: @comment.recipe_id }
    end
    assert_equal 'Access denied.', flash[:error]
    assert_redirected_to root_url
  end


end
