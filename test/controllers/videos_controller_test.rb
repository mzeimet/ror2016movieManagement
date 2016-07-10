require 'test_helper'

class VideosControllerTest < ActionController::TestCase
  include Devise::TestHelpers
  include Warden::Test::Helpers
  setup do
    @video = videos(:one)
    sign_in users(:user1)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:videos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create video" do
    assert_difference('Video.count') do
      post :create , video: { ageRating: @video.ageRating, cover: @video.cover, length: @video.length, name: @video.name, note: @video.note,
                                raiting: @video.raiting, release: @video.release, seen: @video.seen, summary: @video.summary, videoType: @video.videoType,
                                location_attributes: {description: locations(:one).description

                                                      }
                              }, platforms:{name: platforms(:one).name,  borrowed: platforms(:one).borrowed,
                                                    borrowedDate: platforms(:one).borrowedDate, id: platforms(:one).id}

    end

    assert_redirected_to video_path(assigns(:video))
  end

  test "should show video" do
    get :show, id: @video
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @video
    assert_response :success
  end

  test "should update video" do
    patch :update, id: @video, video: { ageRating: @video.ageRating, cover: @video.cover, length: @video.length, name: @video.name, note: @video.note,
                              raiting: @video.raiting, release: @video.release, seen: @video.seen, summary: @video.summary, videoType: @video.videoType,
                              location_attributes: {description: locations(:one).description
                                                    }
                            }, platforms:{name: platforms(:one).name,  borrowed: platforms(:one).borrowed,
                                                  borrowedDate: platforms(:one).borrowedDate, id: platforms(:one).id}
    assert_redirected_to video_path(assigns(:video))
  end

  test "should destroy video" do
    assert_difference('Video.count', -1) do
      delete :destroy, id: @video
    end

    assert_redirected_to videos_path
  end
end
