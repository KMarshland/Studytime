require 'test_helper'

class StudygroupsControllerTest < ActionController::TestCase
  setup do
    @studygroup = studygroups(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:studygroups)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create studygroup" do
    assert_difference('Studygroup.count') do
      post :create, studygroup: { description: @studygroup.description, location: @studygroup.location, name: @studygroup.name, time: @studygroup.time }
    end

    assert_redirected_to studygroup_path(assigns(:studygroup))
  end

  test "should show studygroup" do
    get :show, id: @studygroup
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @studygroup
    assert_response :success
  end

  test "should update studygroup" do
    patch :update, id: @studygroup, studygroup: { description: @studygroup.description, location: @studygroup.location, name: @studygroup.name, time: @studygroup.time }
    assert_redirected_to studygroup_path(assigns(:studygroup))
  end

  test "should destroy studygroup" do
    assert_difference('Studygroup.count', -1) do
      delete :destroy, id: @studygroup
    end

    assert_redirected_to studygroups_path
  end
end
