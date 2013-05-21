require 'test_helper'

class TestNumbersControllerTest < ActionController::TestCase
  setup do
    @test_number = test_numbers(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:test_numbers)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create test_number" do
    assert_difference('TestNumber.count') do
      post :create, test_number: { active_avatar_id: @test_number.active_avatar_id, app_id: @test_number.app_id, number: @test_number.number }
    end

    assert_redirected_to test_number_path(assigns(:test_number))
  end

  test "should show test_number" do
    get :show, id: @test_number
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @test_number
    assert_response :success
  end

  test "should update test_number" do
    put :update, id: @test_number, test_number: { active_avatar_id: @test_number.active_avatar_id, app_id: @test_number.app_id, number: @test_number.number }
    assert_redirected_to test_number_path(assigns(:test_number))
  end

  test "should destroy test_number" do
    assert_difference('TestNumber.count', -1) do
      delete :destroy, id: @test_number
    end

    assert_redirected_to test_numbers_path
  end
end
