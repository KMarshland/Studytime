require 'test_helper'

class TestStuffsControllerTest < ActionController::TestCase
  setup do
    @test_stuff = test_stuffs(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:test_stuffs)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create test_stuff" do
    assert_difference('TestStuff.count') do
      post :create, test_stuff: { duration: @test_stuff.duration }
    end

    assert_redirected_to test_stuff_path(assigns(:test_stuff))
  end

  test "should show test_stuff" do
    get :show, id: @test_stuff
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @test_stuff
    assert_response :success
  end

  test "should update test_stuff" do
    patch :update, id: @test_stuff, test_stuff: { duration: @test_stuff.duration }
    assert_redirected_to test_stuff_path(assigns(:test_stuff))
  end

  test "should destroy test_stuff" do
    assert_difference('TestStuff.count', -1) do
      delete :destroy, id: @test_stuff
    end

    assert_redirected_to test_stuffs_path
  end
end
