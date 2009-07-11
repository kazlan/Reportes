require 'test_helper'

class ReportesControllerTest < ActionController::TestCase
  def test_should_get_index
    get :index
    assert_response :success
    assert_not_nil assigns(:reportes)
  end

  def test_should_get_new
    get :new
    assert_response :success
  end

  def test_should_create_reporte
    assert_difference('Reporte.count') do
      post :create, :reporte => { }
    end

    assert_redirected_to reporte_path(assigns(:reporte))
  end

  def test_should_show_reporte
    get :show, :id => reportes(:one).id
    assert_response :success
  end

  def test_should_get_edit
    get :edit, :id => reportes(:one).id
    assert_response :success
  end

  def test_should_update_reporte
    put :update, :id => reportes(:one).id, :reporte => { }
    assert_redirected_to reporte_path(assigns(:reporte))
  end

  def test_should_destroy_reporte
    assert_difference('Reporte.count', -1) do
      delete :destroy, :id => reportes(:one).id
    end

    assert_redirected_to reportes_path
  end
end
