# == Schema Information
#
# Table name: resultados
#
#  id              :integer          not null, primary key
#  periodo         :date
#  valor_meta      :decimal(10, 2)
#  valor_realizado :decimal(10, 2)
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  cliente_id      :integer
#
# Indexes
#
#  index_resultados_on_cliente_id  (cliente_id)
#
FactoryBot.define do
  factory :resultado do
    cliente
    periodo { Date.today }
    valor_meta { 10 }
    valor_realizado { 12 }
  end
end
