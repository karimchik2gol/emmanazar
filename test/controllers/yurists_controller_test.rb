require 'test_helper'

class YuristsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @yurist = yurists(:one)
  end

  test "should get index" do
    get yurists_url
    assert_response :success
  end

  test "should get new" do
    get new_yurist_url
    assert_response :success
  end

  test "should create yurist" do
    assert_difference('Yurist.count') do
      post yurists_url, params: { yurist: { status: @yurist.status } }
    end

    assert_redirected_to yurist_url(Yurist.last)
  end

  test "should show yurist" do
    get yurist_url(@yurist)
    assert_response :success
  end

  test "should get edit" do
    get edit_yurist_url(@yurist)
    assert_response :success
  end

  test "should update yurist" do
    patch yurist_url(@yurist), params: { yurist: { status: @yurist.status } }
    assert_redirected_to yurist_url(@yurist)
  end

  test "should destroy yurist" do
    assert_difference('Yurist.count', -1) do
      delete yurist_url(@yurist)
    end

    assert_redirected_to yurists_url
  end
end
