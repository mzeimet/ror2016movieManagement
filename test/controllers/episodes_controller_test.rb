require 'test_helper'

class EpisodesControllerTest < ActionController::TestCase
  include Devise::TestHelpers
  include Warden::Test::Helpers
  setup do
    @episode = episodes(:one)
    @video = videos(:one)
    sign_in users(:user1)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:episodes)
  end

  test "should get new" do
    get :new, season:@episode.season.id
    assert_response :success
  end

  test "should create episode" do
    assert_difference('Episode.count') do
      params = {episode: { episodeNumber: @episode.episodeNumber+2,season: @episode.season },
      video: {videoType: "2", name: @video.name, location_attributes: {description: locations(:one).description }},
      platforms: {name: platforms(:one).name,  borrowed: platforms(:one).borrowed,borrowedDate: platforms(:one).borrowedDate, id: platforms(:one).id}
    }
      post :create, params
    end
    #  puts(assigns(:episode).errors.messages)
    assert_redirected_to episode_path(assigns(:episode))

  end

  test "should show episode" do
    get :show, id: @episode
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @episode
    assert_response :success
  end

  test "should update episode" do
    params = { id: @episode,episode: { episodeNumber: @episode.episodeNumber+2,season: @episode.season },
    video: {videoType: "2", name: @video.name, location_attributes: {description: locations(:one).description }},
    platforms: {name: platforms(:one).name,  borrowed: platforms(:one).borrowed,borrowedDate: platforms(:one).borrowedDate, id: platforms(:one).id}
  }
    patch :update, params
      assert_redirected_to episode_path(assigns(:episode))
  end

  test "should destroy episode" do
    assert_difference('Episode.count', -1) do
      delete :destroy, id: @episode
    end

    assert_redirected_to episodes_path
  end
end
