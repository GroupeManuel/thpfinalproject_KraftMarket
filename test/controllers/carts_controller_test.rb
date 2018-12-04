require 'test_helper'

class CartsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get carts_new_url
    assert_response :success
  end

  test "should get create" do
    get carts_create_url
    assert_response :success
  end

  test "should get destroy" do
    get carts_destroy_url
    assert_response :success
  end

end
