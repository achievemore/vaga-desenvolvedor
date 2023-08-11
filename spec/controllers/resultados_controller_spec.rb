require 'rails_helper'

RSpec.describe ResultadosController, type: :controller do
  let(:arquivo_valido) { { file: fixture_file_upload('metas_validas.csv', 'text/csv') } }

  let(:cliente) {
    create(:cliente)
  }

  let(:valid_attributes) {
    { cliente_id: cliente.id, periodo: Date.today, valor_meta: 10, valor_realizado: 12 }
  }

  let(:valid_session) { {} }

  describe "GET #index" do
    it "returns a success response" do
      resultado = Resultado.create! valid_attributes
      get :index, params: {}, session: valid_session
      expect(response).to be_successful
      expect(JSON.parse(response.body, symbolize_names: true)[:resultados])
        .to eq([{ id: resultado.id,
                  valor_meta: resultado.valor_meta.to_s,
                  valor_realizado: resultado.valor_realizado.to_s,
                  cliente: { id: resultado.cliente.id,
                             nome: resultado.cliente.nome }
        }])
    end
  end

  describe "GET #show" do
    it "returns a success response" do
      resultado = Resultado.create! valid_attributes
      get :show, params: {id: resultado.to_param}, session: valid_session
      expect(response).to be_successful
      expect(JSON.parse(response.body, symbolize_names: true)[:resultado])
        .to eq({ id: resultado.id,
                 valor_meta: resultado.valor_meta.to_s,
                 valor_realizado: resultado.valor_realizado.to_s,
                 cliente: { id: resultado.cliente.id,
                            nome: resultado.cliente.nome }
        })
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new Resultado" do
        expect {
          post :create, params: {resultado: valid_attributes}, session: valid_session
        }.to change(Resultado, :count).by(1)
        expect(response).to have_http_status(:created)
        expect(JSON.parse(response.body, symbolize_names: true)[:resultado])
          .to include({ valor_meta: '10.0',
                        valor_realizado: '12.0',
                        cliente: { id: cliente.id,
                                   nome: cliente.nome }
          })
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) {
        { valor_meta: 20, valor_realizado: 30 }
      }

      it "updates the requested resultado" do
        resultado = Resultado.create! valid_attributes
        put :update, params: {id: resultado.to_param, resultado: new_attributes}, session: valid_session
        resultado.reload
        expect(resultado.valor_meta.to_s).to eq('20.0')
        expect(resultado.valor_realizado.to_s).to eq('30.0')
      end

      it "renders a JSON response with the resultado" do
        resultado = Resultado.create! valid_attributes

        put :update, params: {id: resultado.to_param, resultado: new_attributes}, session: valid_session
        expect(response).to have_http_status(:accepted)
        expect(response.content_type).to eq('application/json; charset=utf-8')
        expect(JSON.parse(response.body, symbolize_names: true)[:resultado])
          .to eq({ id: resultado.id,
                   valor_meta: '20.0',
                   valor_realizado: '30.0',
                   cliente: { id: cliente.id,
                              nome: cliente.nome }
          })
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested resultado" do
      resultado = Resultado.create! valid_attributes
      expect {
        delete :destroy, params: {id: resultado.to_param}, session: valid_session
      }.to change(Resultado, :count).by(-1)
      expect(response).to have_http_status(:no_content)
    end

    context 'with no resultado' do
      it "do not destroys the requested cliente" do
        resultado = Resultado.create! valid_attributes
        expect {
          delete :destroy, params: {id: resultado.to_param + '1'}, session: valid_session
      }.to_not change(Resultado, :count)
          expect(response).to have_http_status(:not_found)
      end
    end
  end

  describe "Teste final!" do
    it "qual a resposta para a vida o universo e tudo mais?" do
      resposta = Base64.encode64("42")
      expect("NDI=\n").to eq(resposta)
    end
  end
end
