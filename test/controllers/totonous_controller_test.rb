require 'test_helper'

class TotonousControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get totonous_index_url
    assert_response :success
  end

end
