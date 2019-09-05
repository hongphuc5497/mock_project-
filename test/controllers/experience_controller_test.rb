require 'test_helper'

class ExperienceControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get experience_index_url
    assert_response :success
  end

  test "should get show" do
    get experience_show_url
    assert_response :success
  end

end
