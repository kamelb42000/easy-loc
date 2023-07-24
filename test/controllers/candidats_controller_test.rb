require "test_helper"

class CandidatsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get candidats_index_url
    assert_response :success
  end

  test "should get new" do
    get candidats_new_url
    assert_response :success
  end

  test "should get create" do
    get candidats_create_url
    assert_response :success
  end
end
