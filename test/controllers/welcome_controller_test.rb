require 'test_helper'

class WelcomeControllerTest < ActionController::TestCase
  include Devise::TestHelpers
  include Warden::Test::Helpers
  test "should get index" do
    get :index
    assert_response :success
  end

end
