require 'test_helper'

class SeasonsControllerTest < ActionController::TestCase
  include Devise::TestHelpers
  include Warden::Test::Helpers
  setup do
    @season = seasons(:one)
    sign_in users(:user1)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:seasons)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create season" do
    assert_difference('Season.count') do
      post :create, season: { cover: @season.cover, number: @season.number }
    end

    assert_redirected_to season_path(assigns(:season))
  end

  test "should show season" do
    get :show, id: @season
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @season
    assert_response :success
  end

  test "should update season" do
    patch :update, id: @season, season: { cover: @season.cover, number: @season.number }
    assert_redirected_to season_path(assigns(:season))
  end

  test "should destroy season" do
    assert_difference('Season.count', -1) do
      delete :destroy, id: @season
    end

    assert_redirected_to seasons_path
  end
end
