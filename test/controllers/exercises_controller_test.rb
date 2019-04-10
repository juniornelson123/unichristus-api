require 'test_helper'

class ExercisesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @exercise = exercises(:one)
  end

  test "should get index" do
    get exercises_url, as: :json
    assert_response :success
  end

  test "should create exercise" do
    assert_difference('Exercise.count') do
      post exercises_url, params: { exercise: { description: @exercise.description, file: @exercise.file, study_case_id: @exercise.study_case_id, title: @exercise.title } }, as: :json
    end

    assert_response 201
  end

  test "should show exercise" do
    get exercise_url(@exercise), as: :json
    assert_response :success
  end

  test "should update exercise" do
    patch exercise_url(@exercise), params: { exercise: { description: @exercise.description, file: @exercise.file, study_case_id: @exercise.study_case_id, title: @exercise.title } }, as: :json
    assert_response 200
  end

  test "should destroy exercise" do
    assert_difference('Exercise.count', -1) do
      delete exercise_url(@exercise), as: :json
    end

    assert_response 204
  end
end
