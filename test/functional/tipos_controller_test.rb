require 'test_helper'

class TiposControllerTest < ActionController::TestCase
  def test_should_get_index
    get :index
    assert_response :success
    assert_not_nil assigns(:tipos)
  end

  def test_should_get_new
    get :new
    assert_response :success
  end

  def test_should_create_tipo
    assert_difference('Tipo.count') do
      post :create, :tipo => { }
    end

    assert_redirected_to tipo_path(assigns(:tipo))
  end

  def test_should_show_tipo
    get :show, :id => tipos(:one).id
    assert_response :success
  end

  def test_should_get_edit
    get :edit, :id => tipos(:one).id
    assert_response :success
  end

  def test_should_update_tipo
    put :update, :id => tipos(:one).id, :tipo => { }
    assert_redirected_to tipo_path(assigns(:tipo))
  end

  def test_should_destroy_tipo
    assert_difference('Tipo.count', -1) do
      delete :destroy, :id => tipos(:one).id
    end

    assert_redirected_to tipos_path
  end
end
