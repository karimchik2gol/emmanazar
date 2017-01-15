require 'test_helper'

class ZabydovnuksControllerTest < ActionDispatch::IntegrationTest
  setup do
    @zabydovnuk = zabydovnuks(:one)
  end

  test "should get index" do
    get zabydovnuks_url
    assert_response :success
  end

  test "should get new" do
    get new_zabydovnuk_url
    assert_response :success
  end

  test "should create zabydovnuk" do
    assert_difference('Zabydovnuk.count') do
      post zabydovnuks_url, params: { zabydovnuk: { name: @zabydovnuk.name, projects_count: @zabydovnuk.projects_count, years_on_market: @zabydovnuk.years_on_market } }
    end

    assert_redirected_to zabydovnuk_url(Zabydovnuk.last)
  end

  test "should show zabydovnuk" do
    get zabydovnuk_url(@zabydovnuk)
    assert_response :success
  end

  test "should get edit" do
    get edit_zabydovnuk_url(@zabydovnuk)
    assert_response :success
  end

  test "should update zabydovnuk" do
    patch zabydovnuk_url(@zabydovnuk), params: { zabydovnuk: { name: @zabydovnuk.name, projects_count: @zabydovnuk.projects_count, years_on_market: @zabydovnuk.years_on_market } }
    assert_redirected_to zabydovnuk_url(@zabydovnuk)
  end

  test "should destroy zabydovnuk" do
    assert_difference('Zabydovnuk.count', -1) do
      delete zabydovnuk_url(@zabydovnuk)
    end

    assert_redirected_to zabydovnuks_url
  end
end
