class ResultadoSerializer < ApplicationSerializer
  type :resultado
  belongs_to :cliente
  attributes :id, :valor_meta, :valor_realizado
end
