require 'rails_helper'
require 'csv'
require 'validadores'
require 'resultados'

include ActionDispatch::TestProcess::FixtureFile

RSpec.describe Validadores, type: :lib do
  describe "Importando arquivos" do
    let(:arquivo_valido) { { file: fixture_file_upload('arquivo_valido.csv', 'text/csv') } }
    let(:arquivo_invalido) { { file: fixture_file_upload('arquivo_invalido.csv', 'text/csv') } }

    context "Arquivo valido" do
      it "validando datas" do
        @file = File.open(arquivo_valido[:file])
        CSV.foreach(@file, headers: true, header_converters: :symbol, col_sep: ';') do |row|
          break unless Validadores.data(row[:periodo])
          cliente = Cliente.create!(nome: row[:cliente])
          cliente.resultado.create!(periodo: row[:periodo], valor_meta: row[:valor_meta], valor_realizado: row[:valor_realizado])
        end

        expect(Cliente.all.size).to eq(3)
        expect(Cliente.first.nome).to eq('Cliente 1')
        expect(Cliente.second.nome).to eq('Cliente 2')
        expect(Cliente.third.nome).to eq('Cliente 3')
      end

      it "salva arquivo na base e calcula performance total" do
        @file = File.open(arquivo_valido[:file])
        expect {
          CSV.foreach(@file, headers: true, header_converters: :symbol, col_sep: ';') do |row|
            cliente = Cliente.create!(nome: row[:cliente])
            cliente.resultado.create!(periodo: row[:periodo], valor_meta: row[:valor_meta], valor_realizado: row[:valor_realizado])
          end
        }.to perform_under(15).ms
      end
    end

    context "Arquivo invalido" do
      it "validando datas" do
        begin
          @file = File.open(arquivo_invalido[:file])
          ActiveRecord::Base.transaction do
            CSV.foreach(@file, headers: true, header_converters: :symbol, col_sep: ';') do |row|
              raise StandardError unless Validadores.data(row[:periodo])
              cliente = Cliente.create!(nome: row[:cliente])
              cliente.resultado.create!(periodo: row[:periodo], valor_meta: row[:valor_meta], valor_realizado: row[:valor_realizado])
            end
          end
        rescue StandardError
          nil
        end

        expect(Cliente.all.size).to eq(0)
      end
    end
  end
end
