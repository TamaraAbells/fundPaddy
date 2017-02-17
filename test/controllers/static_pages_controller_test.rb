require 'test_helper'

class StaticPagesControllerTest < ActionDispatch::IntegrationTest
  test "should get about" do
    get static_pages_about_url
    assert_response :success
  end

  test "should get how-it-works" do
    get static_pages_how-it-works_url
    assert_response :success
  end

  test "should get promotions" do
    get static_pages_promotions_url
    assert_response :success
  end

end
