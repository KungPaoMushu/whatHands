require 'test_helper'

class PagesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get pages_index_url
    assert_response :success
  end

  test "should get about" do
    get pages_about_url
    assert_response :success
  end

  test "should get addrecipe" do
    get pages_addrecipe_url
    assert_response :success
  end

  test "should get recipes" do
    get pages_recipes_url
    assert_response :success
  end

  test "should get contact" do
    get pages_contact_url
    assert_response :success
  end

  test "should get signin" do
    get pages_signin_url
    assert_response :success
  end

  test "should get signup" do
    get pages_signup_url
    assert_response :success
  end

  test "should get 404" do
    get pages_404_url
    assert_response :success
  end

  test "should get 422" do
    get pages_422_url
    assert_response :success
  end

  test "should get 500" do
    get pages_500_url
    assert_response :success
  end

end
