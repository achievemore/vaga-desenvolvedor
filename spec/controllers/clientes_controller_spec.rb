require 'rails_helper'

RSpec.describe ClientesController, type: :controller do
  let(:arquivo) { fixture_file_upload('arquivo_valido.csv', 'text/csv')  }
  let!(:cliente) { create(:cliente, arquivo: arquivo ) }

  let(:cliente_attr) { attributes_for(:cliente, arquivo: arquivo) }

  let(:valid_session) { {} }

  describe "GET #index" do
    it "returns a success response" do
      get :index, params: {}, session: valid_session
      expect(response).to be_successful
    end
  end

  describe "GET #show" do
    it "returns a success response" do
      get :show, params: {id: cliente.to_param}, session: valid_session
      expect(response).to be_successful
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new Cliente" do
        expect {
          post :create, params: {cliente: cliente_attr}, session: valid_session
        }.to change(Cliente, :count).by(1)
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:arquivo_invalido) { fixture_file_upload('arquivo_invalido.csv', 'text/csv')  }

      let(:new_attributes) { attributes_for(:cliente, arquivo: arquivo_invalido) }

      it "updates the requested cliente" do
        put :update, params: {id: cliente.to_param, cliente: new_attributes}, session: valid_session
        cliente.reload
        expect(cliente.nome).to eq(new_attributes[:nome])
        expect(cliente.arquivo.filename.to_s).to eq(new_attributes[:arquivo].original_filename)
      end

      it "renders a JSON response with the cliente" do
        put :update, params: {id: cliente.to_param, cliente: cliente_attr}, session: valid_session
        expect(response).to have_http_status(:ok)
        expect(response.content_type).to eq('application/json')
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested cliente" do
      expect {
        delete :destroy, params: {id: cliente.to_param}, session: valid_session
      }.to change(Cliente, :count).by(-1)
    end
  end

end
