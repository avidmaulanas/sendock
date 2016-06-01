require 'test_helper'

class PlaceCommentsControllerTest < ActionController::TestCase
  setup do
    @place_comment = place_comments(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:place_comments)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create place_comment" do
    assert_difference('PlaceComment.count') do
      post :create, place_comment: { content: @place_comment.content, place_id: @place_comment.place_id, user_id: @place_comment.user_id }
    end

    assert_redirected_to place_comment_path(assigns(:place_comment))
  end

  test "should show place_comment" do
    get :show, id: @place_comment
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @place_comment
    assert_response :success
  end

  test "should update place_comment" do
    patch :update, id: @place_comment, place_comment: { content: @place_comment.content, place_id: @place_comment.place_id, user_id: @place_comment.user_id }
    assert_redirected_to place_comment_path(assigns(:place_comment))
  end

  test "should destroy place_comment" do
    assert_difference('PlaceComment.count', -1) do
      delete :destroy, id: @place_comment
    end

    assert_redirected_to place_comments_path
  end
end
