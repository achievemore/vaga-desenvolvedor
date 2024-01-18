require 'csv'

class ImportaArquivos
  def self.importa_arquivo(arquivo)
    @arquivo = arquivo
    importa_dados
  end

  def self.importa_dados
    CSV.foreach(@arquivo, headers: true, header_converters: :symbol, col_sep: ';') do |row|
      next unless Validadores.data(row[:periodo])
      cliente = Cliente.create_or_find_by(nome: row[:cliente])
      cliente.resultado.create(periodo: row[:periodo], valor_meta: row[:valor_meta], valor_realizado: row[:valor_realizado])
    end
  end
end
