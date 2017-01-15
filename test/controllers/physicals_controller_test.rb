require 'test_helper'

class PhysicalsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @physical = physicals(:one)
  end

  test "should get index" do
    get physicals_url
    assert_response :success
  end

  test "should get new" do
    get new_physical_url
    assert_response :success
  end

  test "should create physical" do
    assert_difference('Physical.count') do
      post physicals_url, params: { physical: { bord_date: @physical.bord_date, card_number: @physical.card_number, passport: @physical.passport } }
    end

    assert_redirected_to physical_url(Physical.last)
  end

  test "should show physical" do
    get physical_url(@physical)
    assert_response :success
  end

  test "should get edit" do
    get edit_physical_url(@physical)
    assert_response :success
  end

  test "should update physical" do
    patch physical_url(@physical), params: { physical: { bord_date: @physical.bord_date, card_number: @physical.card_number, passport: @physical.passport } }
    assert_redirected_to physical_url(@physical)
  end

  test "should destroy physical" do
    assert_difference('Physical.count', -1) do
      delete physical_url(@physical)
    end

    assert_redirected_to physicals_url
  end
end
