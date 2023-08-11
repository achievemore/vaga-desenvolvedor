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
      expect(response).to be_successful
      expect(JSON.parse(response.body, symbolize_names: true)[:clientes])
        .to eq([{ id: cliente.id, nome: cliente.nome }])
    end
  end

  describe "GET #show" do
    it "returns a success response" do
      cliente = Cliente.create! valid_attributes
      get :show, params: {id: cliente.to_param}, session: valid_session
      expect(response).to be_successful
      expect(JSON.parse(response.body, symbolize_names: true)[:cliente])
        .to eq({ id: cliente.id, nome: cliente.nome })
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new Cliente" do
        expect {
          post :create, params: {cliente: valid_attributes}, session: valid_session
        }.to change(Cliente, :count).by(1)
        expect(response).to have_http_status(:created)
        expect(JSON.parse(response.body, symbolize_names: true)[:cliente])
          .to include({ nome: 'AchieveMore' })
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) {
        { nome: "Jorge" }
      }

      it "updates the requested cliente" do
        cliente = Cliente.create! valid_attributes
        put :update, params: {id: cliente.to_param, cliente: new_attributes}, session: valid_session
        cliente.reload
        expect(cliente.nome).to eq('Jorge')
      end

      it "renders a JSON response with the cliente" do
        cliente = Cliente.create! valid_attributes

        put :update, params: {id: cliente.to_param, cliente: new_attributes}, session: valid_session
        expect(response).to have_http_status(:accepted)
        expect(response.content_type).to eq('application/json; charset=utf-8')
        expect(JSON.parse(response.body, symbolize_names: true)[:cliente])
          .to eq({ id: cliente.id, nome: 'Jorge' })
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested cliente" do
      cliente = Cliente.create! valid_attributes
      expect {
        delete :destroy, params: {id: cliente.to_param}, session: valid_session
      }.to change(Cliente, :count).by(-1)
      expect(response).to have_http_status(:no_content)
    end
  end

  context 'with no cliente' do
    it "do not destroys the requested cliente" do
      cliente = Cliente.create! valid_attributes
      expect {
        delete :destroy, params: {id: cliente.to_param + '1'}, session: valid_session
      }.to_not change(Cliente, :count)
      expect(response).to have_http_status(:not_found)
    end
  end
end
