require "test_helper"

class CategoriaControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get categoria_index_url
    assert_response :success
  end

  test "should get show" do
    get categoria_show_url
    assert_response :success
  end

  test "should get create" do
    get categoria_create_url
    assert_response :success
  end

  test "should get update" do
    get categoria_update_url
    assert_response :success
  end

  test "should get destroy" do
    get categoria_destroy_url
    assert_response :success
  end
end
