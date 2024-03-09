require 'csv'
require 'validadores'
require 'calculos'

class ImportaArquivos
  attr_accessor :arquivo, :performance_total

  def initialize(arquivo)
    @arquivo = arquivo
  end

  def importar_dados
    CSV.foreach(@arquivo, headers: true, header_converters: :symbol, col_sep: ';') do |row|
      next unless row[:valor_meta].present?
      next unless Validadores.data(row[:periodo])
      cliente = Cliente.find_or_create_by(nome: row[:cliente])
      cliente.resultado.create(
        periodo: row[:periodo], valor_meta: row[:valor_meta],
        valor_realizado: row[:valor_realizado]
      )
    end
  end

  def calcular_performance_total
    performance = BigDecimal(0)
    CSV.foreach(@arquivo, headers: true, header_converters: :symbol, col_sep: ';') do |row|
      performance += BigDecimal(Calculos.performance(row[:valor_meta], row[:valor_realizado]).to_s)
    end
    performance.round(10).to_f
  end
end
