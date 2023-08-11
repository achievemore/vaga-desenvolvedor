class Resultado < ApplicationRecord
  validates :valor_meta, :valor_realizado, :periodo, presence: true

  belongs_to :cliente
end
