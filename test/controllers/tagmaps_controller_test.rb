require 'test_helper'

class TagmapsControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get tagmaps_create_url
    assert_response :success
  end

  test "should get destroy" do
    get tagmaps_destroy_url
    assert_response :success
  end

end
