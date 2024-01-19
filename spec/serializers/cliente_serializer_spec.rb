# frozen_string_literal: true

RSpec.describe ClienteSerializer, type: :serializer do
  let(:cliente) do
    create(:cliente)
  end

  it 'serializer correct' do
    expect(ClienteSerializer.new(cliente).as_json).to eq(
      {
        id: cliente.id,
        nome: cliente.nome
      }
    )
  end
end
