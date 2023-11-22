require 'rails_helper'
require 'csv'
require 'validadores'
require 'resultados'
require 'calculos'

include ActionDispatch::TestProcess::FixtureFile

RSpec.describe Validadores, type: :lib do
  describe "Importando arquivos" do
    let(:arquivo_valido) { { file: fixture_file_upload('arquivo_valido.csv', 'text/csv') } }
    let(:arquivo_invalido) { { file: fixture_file_upload('arquivo_invalido.csv', 'text/csv') } }

    context "Arquivo valido" do
      it "validando datas" do
        @file = File.open(arquivo_valido[:file])

        CSV.foreach(@file, {headers: true, header_converters: :symbol, col_sep: ';'}) do |row|
          break unless Validadores.data(row[:periodo])
          cliente = Cliente.create!(nome: row[:cliente])
          cliente.resultado.create!(periodo: row[:periodo], valor_meta: row[:valor_meta], valor_realizado: row[:valor_realizado])
        end

        expect(Cliente.all.size).to eq(3)
        expect(Resultado.all.size).to eq(3)
      end

      it "salva arquivo na base e calcula performance total" do
        @file = File.open(arquivo_valido[:file])

        CSV.foreach(@file, {headers: true, header_converters: :symbol, col_sep: ';'}) do |row|
          cliente = Cliente.create!(nome: row[:cliente], arquivo: arquivo_valido[:file])

          expect(cliente.arquivo).to be_attached

          cliente.resultado.create!(periodo: row[:periodo], valor_meta: row[:valor_meta], valor_realizado: row[:valor_realizado])

          valor_performance = Calculos.performance(row[:valor_meta], row[:valor_realizado])
          expect(valor_performance).to eq(row[:valor_realizado].to_f / row[:valor_meta].to_f)
        end
      end
    end

    context "Arquivo invalido" do
      it "validando datas" do
        @file = File.open(arquivo_invalido[:file])
        CSV.foreach(@file, {headers: true, header_converters: :symbol, col_sep: ';'}) do |row|
          begin
            ActiveRecord::Base.transaction do
              break unless Validadores.data(row[:periodo])
              @match_periodo = row[:periodo] if @match_periodo.nil?
              break if @match_periodo != row[:periodo]

              cliente = Cliente.create!(nome: row[:cliente])
              result = cliente.resultado.create!(periodo: row[:periodo], valor_meta: row[:valor_meta], valor_realizado: row[:valor_realizado])
            end
          rescue StandardError => e
            e
          end
        end 
        expect(Cliente.all.size).to eq(1)
        expect(Resultado.all.size).to eq(1)
      end

      it "inserindo linhas na base somente se arquivo valido" do
        @file = File.open(arquivo_invalido[:file])
        @match_periodo = nil
        
        CSV.foreach(@file, {headers: true, header_converters: :symbol, col_sep: ';'}) do |row|
          begin
            ActiveRecord::Base.transaction do
              break unless Validadores.data(row[:periodo])
              @match_periodo = row[:periodo] if @match_periodo.nil?
              break if @match_periodo != row[:periodo]

              cliente = Cliente.create!(nome: row[:cliente])
              result = cliente.resultado.create!(periodo: row[:periodo], valor_meta: row[:valor_meta], valor_realizado: row[:valor_realizado])
            end
          rescue StandardError => e
            e
          end
        end 
        # catch error
        expect(Cliente.all.size).to eq(1)
        expect(Resultado.all.size).to eq(1)
      end
    end
  end
end
