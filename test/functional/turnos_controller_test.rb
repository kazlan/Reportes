require 'test_helper'

class TurnosControllerTest < ActionController::TestCase
  def test_should_get_index
    get :index
    assert_response :success
    assert_not_nil assigns(:turnos)
  end

  def test_should_get_new
    get :new
    assert_response :success
  end

  def test_should_create_turno
    assert_difference('Turno.count') do
      post :create, :turno => { }
    end

    assert_redirected_to turno_path(assigns(:turno))
  end

  def test_should_show_turno
    get :show, :id => turnos(:one).id
    assert_response :success
  end

  def test_should_get_edit
    get :edit, :id => turnos(:one).id
    assert_response :success
  end

  def test_should_update_turno
    put :update, :id => turnos(:one).id, :turno => { }
    assert_redirected_to turno_path(assigns(:turno))
  end

  def test_should_destroy_turno
    assert_difference('Turno.count', -1) do
      delete :destroy, :id => turnos(:one).id
    end

    assert_redirected_to turnos_path
  end
end
