require 'test_helper'

class ContestantsControllerTest < ActionController::TestCase
  setup do
    @contestant = contestants(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:contestants)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create contestant" do
    assert_difference('Contestant.count') do
      post :create, :contestant => @contestant.attributes
    end

    assert_redirected_to contestant_path(assigns(:contestant))
  end

  test "should show contestant" do
    get :show, :id => @contestant.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @contestant.to_param
    assert_response :success
  end

  test "should update contestant" do
    put :update, :id => @contestant.to_param, :contestant => @contestant.attributes
    assert_redirected_to contestant_path(assigns(:contestant))
  end

  test "should destroy contestant" do
    assert_difference('Contestant.count', -1) do
      delete :destroy, :id => @contestant.to_param
    end

    assert_redirected_to contestants_path
  end
end
