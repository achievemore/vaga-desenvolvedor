RSpec.describe CalculosController, type: :controller do
  let(:cliente) {
    create(:cliente)
  }

  describe "not authorized" do
    it "returns a not found response" do
      get :performance

      expect(response).to have_http_status(:unauthorized)
    end
  end

  describe "GET #performance" do
    include_context 'with authentication'

    it "com atributos validos", :aggregate_failures do
      resultado = create(:resultado, cliente:, valor_meta: 10.5, valor_realizado: 12.7)

      get :performance, params: {valor_meta: resultado.valor_meta, valor_realizado: resultado.valor_realizado}

      expect(response).to be_successful
      expect(json['valor_performance']).to eq(1.2095238095238094)
    end

    it "com atributos inválidos", :aggregate_failures do
      resultado = create(:resultado, cliente:, valor_meta: 0, valor_realizado: 12.7)

      get :performance, params: {valor_meta: resultado.valor_meta, valor_realizado: resultado.valor_realizado}

      expect(response).to be_successful
      expect(json['valor_performance']).to eq(0)
    end
  end
end
