require 'rails_helper'

RSpec.describe ResultadosController, type: :controller do
  let(:cliente) {
    create(:cliente)
  }

  let(:valid_attributes) {
    { cliente_id: cliente.id, periodo: Date.today, valor_meta: 10, valor_realizado: 12 }
  }

  let(:resultado) { Resultado.create! valid_attributes }

  describe "not authorized" do
    it "returns a not found response" do
      get :index

      expect(response).to have_http_status(:unauthorized)
    end
  end

  describe "GET #index" do
    include_context 'with authentication'

    it "returns a success response" do
      get :index, params: {}

      expect(response).to be_successful
    end
  end

  describe "GET #show" do
    include_context 'with authentication'

    it "returns a success response" do
      get :show, params: {id: resultado.id}

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
      it "creates a new Resultado" do
        expect {
          post :create, params: {resultado: valid_attributes}
        }.to change(Resultado, :count).by(1)
      end
    end
  end

  describe "PUT #update" do
    include_context 'with authentication'

    context "with valid params" do
      let(:new_attributes) {
        { valor_meta: 10.5, valor_realizado: 12.7 }
      }

      it "updates the requested resultado", :aggregate_failures do
        put :update, params: {id: resultado.to_param, resultado: new_attributes}

        resultado.reload

        expect(resultado.valor_meta).to eq(10.5)
        expect(resultado.valor_realizado).to eq(12.7)
      end

      it "renders a JSON response with the resultado" do
        put :update, params: {id: resultado.to_param, resultado: valid_attributes}

        expect(response).to have_http_status(:ok)
        expect(response.content_type).to include('application/json')
      end
    end
  end

  describe "DELETE #destroy" do
    include_context 'with authentication'

    it "destroys the requested resultado" do
      resultado = Resultado.create! valid_attributes

      expect {
        delete :destroy, params: {id: resultado.to_param}
      }.to change(Resultado, :count).by(-1)
    end
  end

  describe "Teste final!" do
    it "qual a resposta para a vida o universo e tudo mais?" do
      resposta = Base64.encode64("42")
      expect("NDI=\n").to eq(resposta)
    end
  end
end
