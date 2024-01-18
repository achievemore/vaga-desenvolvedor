require 'rails_helper'

RSpec.describe ClientesController, type: :controller do

  let(:valid_session) { {} }

  describe "GET #index" do
    it "returns a success response" do
      create_list(:cliente, 2)
      create(:cliente, nome: "AchieveMore")

      get :index, params: {}, session: valid_session

      expect(response).to be_successful
      expect(response.body).to include("AchieveMore")
    end
  end

  describe "GET #show" do
    it "returns a success response" do
      cliente = create(:cliente)

      get :show, params: {id: cliente.to_param}, session: valid_session

      expect(response).to be_successful
    end

    it "returns a not found response" do
      get :show, params: {id: 12481632}, session: valid_session

      expect(response).to have_http_status(:not_found)
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new Cliente" do
        cliente = build(:cliente)

        expect {
          post :create, params: { cliente: cliente.attributes }, session: valid_session
        }.to change(Cliente, :count).by(1)
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) {
        { nome: "AchieveMore updated" }
      }

      it "updates the requested cliente" do
        cliente = create(:cliente)

        put :update, params: {id: cliente.to_param, cliente: new_attributes}, session: valid_session
        cliente.reload

        expect(cliente.nome).to eq("AchieveMore updated")
      end

      it "renders a JSON response with the cliente" do
        cliente = create(:cliente)

        put :update, params: {id: cliente.to_param, cliente: cliente.attributes}, session: valid_session

        expect(response).to have_http_status(:ok)
        expect(response.content_type).to include('application/json')
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested cliente" do
      cliente = create(:cliente)

      expect {
        delete :destroy, params: {id: cliente.to_param}
      }.to change(Cliente, :count).by(-1)
    end
  end
end
