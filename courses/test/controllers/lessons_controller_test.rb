require 'test_helper'

class LessonsControllerTest < ActionController::TestCase
  setup do
    @lesson = lessons(:one)
  end

  test "should get new.html.erb.erb" do
    get :'new.html.erb.erb'
    assert_response :success
    assert_not_nil assigns(:lessons)
  end

  test "should get index" do
    get :index
    assert_response :success
  end

  test "should create lesson" do
    assert_difference('Lesson.count') do
      post :create, lesson: { contenturl: @lesson.contenturl, course_id: @lesson.course_id, description: @lesson.description, level_id: @lesson.level_id, title: @lesson.title }
    end

    assert_redirected_to lesson_path(assigns(:lesson))
  end

  test "should show lesson" do
    get :show, id: @lesson
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @lesson
    assert_response :success
  end

  test "should update lesson" do
    patch :update, id: @lesson, lesson: { contenturl: @lesson.contenturl, course_id: @lesson.course_id, description: @lesson.description, level_id: @lesson.level_id, title: @lesson.title }
    assert_redirected_to lesson_path(assigns(:lesson))
  end

  test "should destroy lesson" do
    assert_difference('Lesson.count', -1) do
      delete :destroy, id: @lesson
    end

    assert_redirected_to lessons_path
  end
end
