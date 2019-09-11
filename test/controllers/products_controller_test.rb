require 'test_helper'

class ProductsControllerTest < ActionDispatch::IntegrationTest
  test "should get phones" do
    get products_phones_url
    assert_response :success
  end

  test "should get headphones" do
    get products_headphones_url
    assert_response :success
  end

  test "should get chargers" do
    get products_chargers_url
    assert_response :success
  end

end
