require 'rails_helper'

RSpec.describe ClientesController, type: :controller do

  let(:valid_attributes) {
    { nome: "AchieveMore" }
  }

  let(:valid_session) { {} }

  describe "GET #index" do
    it "returns a success response" do
      cliente = Cliente.create! valid_attributes
      get :index, params: {}, session: valid_session
      json_response = JSON.parse(response.body)

      expect(response).to be_successful
      expect(json_response['clientes']).to include(JSON.parse(cliente.to_json))
    end
  end

  describe "GET #show" do
    it "returns a success response" do
      cliente = Cliente.create! valid_attributes
      get :show, params: {id: cliente.to_param}, session: valid_session
      json_response = JSON.parse(response.body)

      expect(response).to be_successful
      expect(json_response['cliente']).to include(JSON.parse(cliente.to_json))
    end

    it "returns not a success response" do
      get :show, params: {id: 99}, session: valid_session

      expect(response).not_to be_successful
      expect(response).to have_http_status(:not_found)
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new Cliente" do
        expect {
          post :create, params: {cliente: valid_attributes}, session: valid_session
        }.to change(Cliente, :count).by(1)
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) {
        { nome: "Josué" }
      }

      it "updates the requested cliente" do
        cliente = Cliente.create! valid_attributes
        put :update, params: {id: cliente.to_param, cliente: new_attributes}, session: valid_session
        cliente.reload

        json_response = JSON.parse(response.body)

        expect(response).to have_http_status(:ok)
        expect(response.content_type).to eq('application/json')
        expect(json_response['location']).to include(JSON.parse(cliente.to_json))
        expect(cliente.nome).to eq("Josué")
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested cliente" do
      cliente = Cliente.create! valid_attributes
      expect {
        delete :destroy, params: {id: cliente.to_param}, session: valid_session
      }.to change(Cliente, :count).by(-1)
    end
  end

end
