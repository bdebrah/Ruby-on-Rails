require 'test_helper'

class NavbarControllerTest < ActionDispatch::IntegrationTest
  test "should get home" do
    get navbar_home_url
    assert_response :success
  end

  test "should get login" do
    get navbar_login_url
    assert_response :success
  end

  test "should get products" do
    get navbar_products_url
    assert_response :success
  end

  test "should get contact" do
    get navbar_contact_url
    assert_response :success
  end

end
