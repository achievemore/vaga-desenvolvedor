class Resultado < ApplicationRecord
  belongs_to :cliente

  validates :periodo, :valor_meta, :valor_realizado, presence: true
end
