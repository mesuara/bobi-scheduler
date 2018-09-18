require 'test_helper'

class AppoitmentsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @appoitment = appoitments(:one)
  end

  test "should get index" do
    get appoitments_url
    assert_response :success
  end

  test "should get new" do
    get new_appoitment_url
    assert_response :success
  end

  test "should create appoitment" do
    assert_difference('Appoitment.count') do
      post appoitments_url, params: { appoitment: { description: @appoitment.description, end_time: @appoitment.end_time, field_id: @appoitment.field_id, start_time: @appoitment.start_time, user_id: @appoitment.user_id } }
    end

    assert_redirected_to appoitment_url(Appoitment.last)
  end

  test "should show appoitment" do
    get appoitment_url(@appoitment)
    assert_response :success
  end

  test "should get edit" do
    get edit_appoitment_url(@appoitment)
    assert_response :success
  end

  test "should update appoitment" do
    patch appoitment_url(@appoitment), params: { appoitment: { description: @appoitment.description, end_time: @appoitment.end_time, field_id: @appoitment.field_id, start_time: @appoitment.start_time, user_id: @appoitment.user_id } }
    assert_redirected_to appoitment_url(@appoitment)
  end

  test "should destroy appoitment" do
    assert_difference('Appoitment.count', -1) do
      delete appoitment_url(@appoitment)
    end

    assert_redirected_to appoitments_url
  end
end
