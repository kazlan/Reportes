require 'test_helper'

class TecnicosControllerTest < ActionController::TestCase
  def test_should_get_index
    get :index
    assert_response :success
    assert_not_nil assigns(:tecnicos)
  end

  def test_should_get_new
    get :new
    assert_response :success
  end

  def test_should_create_tecnico
    assert_difference('Tecnico.count') do
      post :create, :tecnico => { }
    end

    assert_redirected_to tecnico_path(assigns(:tecnico))
  end

  def test_should_show_tecnico
    get :show, :id => tecnicos(:one).id
    assert_response :success
  end

  def test_should_get_edit
    get :edit, :id => tecnicos(:one).id
    assert_response :success
  end

  def test_should_update_tecnico
    put :update, :id => tecnicos(:one).id, :tecnico => { }
    assert_redirected_to tecnico_path(assigns(:tecnico))
  end

  def test_should_destroy_tecnico
    assert_difference('Tecnico.count', -1) do
      delete :destroy, :id => tecnicos(:one).id
    end

    assert_redirected_to tecnicos_path
  end
end
