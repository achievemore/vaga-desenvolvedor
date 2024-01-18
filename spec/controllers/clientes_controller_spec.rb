require 'rails_helper'

RSpec.describe ClientesController, type: :controller do

  describe "not authorized" do
    it "returns a not found response" do
      get :index

      expect(response).to have_http_status(:unauthorized)
    end
  end

  describe "GET #index" do
    include_context 'with authentication'

    it "returns a success response" do
      create_list(:cliente, 2)
      create(:cliente, nome: "AchieveMore")

      get :index, params: {}

      expect(response).to be_successful
      expect(response.body).to include("AchieveMore")
    end
  end

  describe "GET #show" do
    include_context 'with authentication'

    it "returns a success response" do
      cliente = create(:cliente)

      get :show, params: {id: cliente.to_param}

      expect(response).to be_successful
    end

    it "returns a not found response" do
      get :show, params: {id: 12481632}

      expect(response).to have_http_status(:not_found)
    end
  end

  describe "POST #create" do
    include_context 'with authentication'

    context "with valid params" do
      it "creates a new Cliente" do
        cliente = build(:cliente)

        expect {
          post :create, params: { cliente: cliente.attributes }
        }.to change(Cliente, :count).by(1)
      end
    end
  end

  describe "PUT #update" do
    include_context 'with authentication'

    context "with valid params" do
      let(:new_attributes) {
        { nome: "AchieveMore updated" }
      }

      it "updates the requested cliente" do
        cliente = create(:cliente)

        put :update, params: {id: cliente.to_param, cliente: new_attributes}
        cliente.reload

        expect(cliente.nome).to eq("AchieveMore updated")
      end

      it "renders a JSON response with the cliente" do
        cliente = create(:cliente)

        put :update, params: {id: cliente.to_param, cliente: cliente.attributes}

        expect(response).to have_http_status(:ok)
        expect(response.content_type).to include('application/json')
      end
    end
  end

  describe "DELETE #destroy" do
    include_context 'with authentication'

    it "destroys the requested cliente" do
      cliente = create(:cliente)

      expect {
        delete :destroy, params: {id: cliente.to_param}
      }.to change(Cliente, :count).by(-1)
    end
  end
end
