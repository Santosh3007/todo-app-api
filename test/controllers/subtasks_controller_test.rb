# frozen_string_literal: true

require 'test_helper'

class SubtasksControllerTest < ActionDispatch::IntegrationTest
  setup do
    @subtask = subtasks(:one)
  end

  test 'should get index' do
    get subtasks_url, as: :json
    assert_response :success
  end

  test 'should create subtask' do
    assert_difference('Subtask.count') do
      post subtasks_url,
           params: { subtask: { completed: @subtask.completed,
                                date: @subtask.date,
                                description: @subtask.description,
                                tag: @subtask.tag,
                                task_id: @subtask.task_id,
                                time: @subtask.time,
                                title: @subtask.title } }, as: :json
    end

    assert_response 201
  end

  test 'should show subtask' do
    get subtask_url(@subtask), as: :json
    assert_response :success
  end

  test 'should update subtask' do
    patch subtask_url(@subtask),
          params: { subtask: {
            completed: @subtask.completed,
            date: @subtask.date,
            description: @subtask.description,
            tag: @subtask.tag,
            task_id: @subtask.task_id,
            time: @subtask.time,
            itle: @subtask.title
          } }, as: :json
    assert_response 200
  end

  test 'should destroy subtask' do
    assert_difference('Subtask.count', -1) do
      delete subtask_url(@subtask), as: :json
    end

    assert_response 204
  end
end
