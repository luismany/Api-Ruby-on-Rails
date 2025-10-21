require "test_helper"

class CategoriasControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get categorias_index_url
    assert_response :success
  end

  test "should get show" do
    get categorias_show_url
    assert_response :success
  end

  test "should get create" do
    get categorias_create_url
    assert_response :success
  end

  test "should get update" do
    get categorias_update_url
    assert_response :success
  end

  test "should get destroy" do
    get categorias_destroy_url
    assert_response :success
  end
end
