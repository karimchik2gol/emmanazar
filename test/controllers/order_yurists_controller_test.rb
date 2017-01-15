require 'test_helper'

class OrderYuristsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @order_yurist = order_yurists(:one)
  end

  test "should get index" do
    get order_yurists_url
    assert_response :success
  end

  test "should get new" do
    get new_order_yurist_url
    assert_response :success
  end

  test "should create order_yurist" do
    assert_difference('OrderYurist.count') do
      post order_yurists_url, params: { order_yurist: { apartment_id: @order_yurist.apartment_id, project_id: @order_yurist.project_id, yurist_id: @order_yurist.yurist_id } }
    end

    assert_redirected_to order_yurist_url(OrderYurist.last)
  end

  test "should show order_yurist" do
    get order_yurist_url(@order_yurist)
    assert_response :success
  end

  test "should get edit" do
    get edit_order_yurist_url(@order_yurist)
    assert_response :success
  end

  test "should update order_yurist" do
    patch order_yurist_url(@order_yurist), params: { order_yurist: { apartment_id: @order_yurist.apartment_id, project_id: @order_yurist.project_id, yurist_id: @order_yurist.yurist_id } }
    assert_redirected_to order_yurist_url(@order_yurist)
  end

  test "should destroy order_yurist" do
    assert_difference('OrderYurist.count', -1) do
      delete order_yurist_url(@order_yurist)
    end

    assert_redirected_to order_yurists_url
  end
end
