require 'rails_helper'

RSpec.describe ResultadosController, type: :controller do
  let(:arquivo) { fixture_file_upload('arquivo_valido.csv', 'text/csv')  }
  let!(:cliente) { create(:cliente, arquivo: arquivo) }

  let!(:resultado) { create(:resultado) }

  let(:resultado_attr) { attributes_for(:resultado, cliente_id: cliente.id) }


  describe "GET #index" do
    it "returns a success response" do
      get :index, params: {}
      expect(response).to be_successful
    end
  end

  describe "GET #show" do
    it "returns a success response" do
      get :show, params: {id: resultado.to_param}
      expect(response).to be_successful
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new Resultado" do
        expect {
          post :create, params: {resultado: resultado_attr}
        }.to change(Resultado, :count).by(1)
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) { attributes_for(:resultado, cliente_id: cliente.id) }

      it "updates the requested resultado" do
        put :update, params: {id: resultado.to_param, resultado: new_attributes}
        resultado.reload

        expect(resultado.periodo).to eq(Date.today)
        expect(resultado.valor_meta).to eq(10)
        expect(resultado.valor_realizado).to eq(12)
        expect(resultado.cliente_id).to eq(cliente.id)
      end

      it "renders a JSON response with the resultado" do
        put :update, params: {id: resultado.to_param, resultado: resultado_attr}
        expect(response).to have_http_status(:ok)
        expect(response.content_type).to eq('application/json')
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested resultado" do
      expect(Resultado.count).to eq(1)
      expect {
        delete :destroy, params: {id: resultado.to_param}
      }.to change(Resultado, :count).by(-1)
    end
  end

  describe "Teste final!" do
    it "qual a resposta para a vida o universo e tudo mais?" do
      resposta = Base64.encode64("42")
      expect("NDI=\n").to eq(resposta)

      resposta2 = Base64.encode64("Eu quero ser o rei dos piratas")
      expect("RXUgcXVlcm8gc2VyIG8gcmVpIGRvcyBwaXJhdGFz\n").to eq(resposta2)
    end
  end
end
