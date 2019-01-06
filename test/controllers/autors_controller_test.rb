require 'test_helper'

class AutorsControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get autors_create_url
    assert_response :success
  end

  test "should get edit" do
    get autors_edit_url
    assert_response :success
  end

  test "should get update" do
    get autors_update_url
    assert_response :success
  end

end
