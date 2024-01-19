# frozen_string_literal: true

RSpec.describe ResultadoSerializer, type: :serializer do
  let(:resultado) do
    create(:resultado)
  end

  it 'serializer correct' do
    expect(ResultadoSerializer.new(resultado).as_json).to eq(
      {
        id: resultado.id,
        valor_meta: resultado.valor_meta,
        valor_realizado: resultado.valor_realizado,
        cliente: {
          id: resultado.cliente.id,
          nome: resultado.cliente.nome
        }
      }
    )
  end
end
