class ImportaArquivos
  attr_accessor :filepath, :file

  def initialize()
    @filepath = filepath
    @file = file
  end

  def perform
    CSV.foreach(@file, headers: true, header_converters: :symbol, col_sep: ';') do |row|
      next unless row[:cliente].present? && row[:periodo].present? &&
                  row[:valor_meta].present? && row[:valor_realizado].present?
      next unless Validadores.data(row[:periodo])

      saving_data(row[:cliente], row[:periodo], row[:valor_meta], row[:valor_realizado])
    end
  end

  def saving_data(cliente, periodo, valor_meta, valor_realizado)
    cliente = Cliente.create!(nome: cliente)
    valor_meta = valor_meta.to_f
    valor_realizado = valor_realizado.to_f
    cliente.resultados.create!(periodo: Validadores.match_periodo(periodo), valor_meta:, valor_realizado:,
                               valor_performance: calculate_perfomance(valor_meta, valor_realizado))
  end

  def calculate_perfomance(valor_meta, valor_realizado)
    resultado = Resultados.new
    resultado.valor_meta = valor_meta
    resultado.valor_realizado = valor_realizado

    resultado.calcula_performance
  end
end
