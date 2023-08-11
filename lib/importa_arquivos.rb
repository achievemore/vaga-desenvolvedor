class ImportaArquivos
  attr_accessor :filepath, :file

  def initialize()
    @filepath = filepath
    @file = file
  end

  def perform
    CSV.foreach(@file, headers: true, header_converters: :symbol, col_sep: ';') do |row|
      next unless row[:cliente].present? && row[:periodo].present? && row[:valor_meta].present? && row[:valor_realizado].present?
      next unless Validadores.data(row[:periodo])

      cliente = Cliente.create!(nome: row[:cliente])
      valor_meta = row[:valor_meta].to_f
      valor_realizado = row[:valor_realizado].to_f
      cliente.resultado.create!(periodo: Validadores.match_periodo(row[:periodo]), valor_meta: valor_meta, valor_realizado: valor_realizado, valor_performance: calculate_perfomance(valor_meta, valor_realizado))
    end
  end

  def calculate_perfomance(valor_meta, valor_realizado)
    resultado = Resultados.new
    resultado.valor_meta = valor_meta
    resultado.valor_realizado = valor_realizado

    resultado.calcula_performance
  end
end
