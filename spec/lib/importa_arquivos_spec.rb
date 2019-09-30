require 'rails_helper'
require 'csv'
require 'validadores'
require 'resultados'

include ActionDispatch::TestProcess::FixtureFile

RSpec.describe Validadores, type: :lib do
  describe "Importando arquivos" do
    let(:arquivo_valido) { { file: fixture_file_upload('arquivo_valido.csv', 'text/csv') } }
    let(:arquivo_invalido) { { file: fixture_file_upload('arquivo_invalido.csv', 'text/csv') } }
    let(:client) { Cliente.last }

    context "Arquivo valido" do
      it "validando datas" do
        @file = File.open(arquivo_valido[:file])

        CSV.foreach(@file, {headers: true, header_converters: :symbol, col_sep: ';'}) do |row|
          break unless Validadores.data(row[:periodo])
          cliente = Cliente.create!(nome: row[:cliente])
          cliente.resultado.create!(periodo: row[:periodo], valor_meta: row[:valor_meta], valor_realizado: row[:valor_realizado])
        end

        expect(Cliente.all.size).to eq(3)
      end

      it "salva arquivo na base e calcula performance total" do
         @file = File.open(arquivo_valido[:file])

         CSV.foreach(@file, {headers: true, header_converters: :symbol, col_sep: ';'}) do |row|
           cliente = Cliente.create!(nome: row[:cliente])
           cliente.resultado.create!(periodo: row[:periodo], valor_meta: row[:valor_meta], valor_realizado: row[:valor_realizado])
         end
         resultado = Resultado.find(client.id)
         performance_total = Resultados.new
         performance_total.valor_meta = resultado.valor_meta
         performance_total.valor_realizado = resultado.valor_realizado
        expect(performance_total).to eq(performance_total)
      end
    end

    context "Arquivo invalido" do
      it "validando datas" do
        @file = File.open(arquivo_invalido[:file])

        CSV.foreach(@file, {headers: true, header_converters: :symbol, col_sep: ';'}) do |row|
          break unless Validadores.valid_data(row[:periodo])
          cliente = Cliente.create!(nome: row[:cliente])
          cliente.resultado.create!(periodo: row[:periodo], valor_meta: row[:valor_meta], valor_realizado: row[:valor_realizado])
        end
        resultado = Resultado.find(client.id)
        expect(resultado.periodo).to eq(nil)
      end

      it "inserindo linhas na base somente se arquivo valido" do
        @file = File.open(arquivo_invalido[:file])

        CSV.foreach(@file, {headers: true, header_converters: :symbol, col_sep: ';'}) do |row|
          break unless Validadores.valid_data(row[:periodo])
          cliente = Cliente.create!(nome: row[:cliente])
          cliente.resultado.create!(periodo: row[:periodo], valor_meta: row[:valor_meta], valor_realizado: row[:valor_realizado])
        end
        expect(Cliente.all.size).to eq(0)
      end
    end
  end
end
