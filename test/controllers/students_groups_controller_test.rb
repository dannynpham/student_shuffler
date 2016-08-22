require 'test_helper'

class StudentsGroupsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @students_group = students_groups(:one)
  end

  test "should get index" do
    get students_groups_url
    assert_response :success
  end

  test "should get new" do
    get new_students_group_url
    assert_response :success
  end

  test "should create students_group" do
    assert_difference('StudentsGroup.count') do
      post students_groups_url, params: { students_group: { studenta: @students_group.studenta, studentb: @students_group.studentb } }
    end

    assert_redirected_to students_group_url(StudentsGroup.last)
  end

  test "should show students_group" do
    get students_group_url(@students_group)
    assert_response :success
  end

  test "should get edit" do
    get edit_students_group_url(@students_group)
    assert_response :success
  end

  test "should update students_group" do
    patch students_group_url(@students_group), params: { students_group: { studenta: @students_group.studenta, studentb: @students_group.studentb } }
    assert_redirected_to students_group_url(@students_group)
  end

  test "should destroy students_group" do
    assert_difference('StudentsGroup.count', -1) do
      delete students_group_url(@students_group)
    end

    assert_redirected_to students_groups_url
  end
end
