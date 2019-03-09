require 'test_helper'

class StudyCasesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @study_case = study_cases(:one)
  end

  test "should get index" do
    get study_cases_url, as: :json
    assert_response :success
  end

  test "should create study_case" do
    assert_difference('StudyCase.count') do
      post study_cases_url, params: { study_case: { class_room_id: @study_case.class_room_id, description: @study_case.description, title: @study_case.title } }, as: :json
    end

    assert_response 201
  end

  test "should show study_case" do
    get api_study_case_url(@study_case), as: :json
    assert_response :success
  end

  test "should update study_case" do
    patch api_study_case_url(@study_case), params: { study_case: { class_room_id: @study_case.class_room_id, description: @study_case.description, title: @study_case.title } }, as: :json
    assert_response 200
  end

  test "should destroy study_case" do
    assert_difference('StudyCase.count', -1) do
      delete api_study_case_url(@study_case), as: :json
    end

    assert_response 204
  end
end
