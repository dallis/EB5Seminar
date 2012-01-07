require 'test_helper'

class HomeControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

  test "should get agenda" do
    get :agenda
    assert_response :success
  end

  test "should get speakers" do
    get :speakers
    assert_response :success
  end

  test "should get venue" do
    get :venue
    assert_response :success
  end

  test "should get sponsors" do
    get :sponsors
    assert_response :success
  end

  test "should get resources" do
    get :resources
    assert_response :success
  end

  test "should get contact" do
    get :contact
    assert_response :success
  end

  test "should get sitemap" do
    get :sitemap
    assert_response :success
  end

end
