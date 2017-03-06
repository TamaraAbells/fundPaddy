require 'test_helper'

class DonationsControllerTest < ActionDispatch::IntegrationTest
  test "should get index," do
    get donations_index,_url
    assert_response :success
  end

  test "should get new," do
    get donations_new,_url
    assert_response :success
  end

  test "should get create," do
    get donations_create,_url
    assert_response :success
  end

  test "should get edit," do
    get donations_edit,_url
    assert_response :success
  end

  test "should get update," do
    get donations_update,_url
    assert_response :success
  end

  test "should get destroy" do
    get donations_destroy_url
    assert_response :success
  end

end
