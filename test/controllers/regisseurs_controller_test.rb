require 'test_helper'

class RegisseursControllerTest < ActionController::TestCase
  setup do
    @regisseur = regisseurs(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:regisseurs)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create regisseur" do
    assert_difference('Regisseur.count') do
      post :create, regisseur: { cover: @regisseur.cover, name: @regisseur.name }
    end

    assert_redirected_to regisseur_path(assigns(:regisseur))
  end

  test "should show regisseur" do
    get :show, id: @regisseur
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @regisseur
    assert_response :success
  end

  test "should update regisseur" do
    patch :update, id: @regisseur, regisseur: { cover: @regisseur.cover, name: @regisseur.name }
    assert_redirected_to regisseur_path(assigns(:regisseur))
  end

  test "should destroy regisseur" do
    assert_difference('Regisseur.count', -1) do
      delete :destroy, id: @regisseur
    end

    assert_redirected_to regisseurs_path
  end
end
