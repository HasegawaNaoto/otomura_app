require 'test_helper'

class CheckControllerTest < ActionDispatch::IntegrationTest
  test "should get genre" do
    get check_genre_url
    assert_response :success
  end

end
