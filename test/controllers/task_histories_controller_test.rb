require 'test_helper'

class TaskHistoriesControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get task_histories_new_url
    assert_response :success
  end

  test "should get create" do
    get task_histories_create_url
    assert_response :success
  end

  test "should get index" do
    get task_histories_index_url
    assert_response :success
  end

  test "should get edit" do
    get task_histories_edit_url
    assert_response :success
  end

  test "should get update" do
    get task_histories_update_url
    assert_response :success
  end

  test "should get destroy" do
    get task_histories_destroy_url
    assert_response :success
  end

end
