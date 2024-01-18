require 'rails_helper'

RSpec.describe CalculosController, type: :controller do
  let(:cliente) {
    create(:cliente)
  }

  let(:valid_attributes) {
    { cliente_id: cliente.id, periodo: Date.today, valor_meta: 10.5, valor_realizado: 12.7 }
  }

  let(:invalid_valid_attributes) {
    { cliente_id: cliente.id, periodo: Date.today, valor_meta: 0.0, valor_realizado: 12.7 }
  }

  describe "not authorized" do
    it "returns a not found response" do
      get :performance

      expect(response).to have_http_status(:unauthorized)
    end
  end

  describe "GET #performance" do
    include_context 'with authentication'

    it "com atributos validos" do
      resultado = Resultado.create! valid_attributes

      get :performance, params: {valor_meta: resultado.valor_meta, valor_realizado: resultado.valor_realizado}

      expect(response).to be_successful
    end

    it "com atributos inválidos" do
      resultado = Resultado.create! valid_attributes

      get :performance, params: {valor_meta: resultado.valor_meta, valor_realizado: resultado.valor_realizado}

      expect(response).to be_successful
    end
  end
end
