require 'rails_helper'
require 'csv'
require 'validadores'
require 'resultados'
require 'importa_arquivos'

include ActionDispatch::TestProcess::FixtureFile

RSpec.describe Validadores, type: :lib do
  describe "Importando arquivos" do
    let(:arquivo_valido) { { file: fixture_file_upload('arquivo_valido.csv', 'text/csv') } }
    let(:arquivo_invalido) { { file: fixture_file_upload('arquivo_invalido.csv', 'text/csv') } }

    context "Arquivo valido" do
      it "validando datas" do
        @file = File.open(arquivo_valido[:file])
        importador = ImportaArquivos.new(@file)
        importador.importar_dados

        expect(Cliente.all.size).to eq(3)
      end

      it "salva arquivo na base e calcula performance total" do
        @file = File.open(arquivo_valido[:file])
        importador = ImportaArquivos.new(@file)
        importador.importar_dados

        expect(importador.calcular_performance_total).to eq(2.2833333333)
      end
    end

    context "Arquivo invalido" do
      it "inserindo linhas na base somente se arquivo valido" do
        @file = File.open(arquivo_invalido[:file])
        importador = ImportaArquivos.new(@file)
        importador.importar_dados

        expect(Cliente.all.size).to eq(1)
      end
    end
  end
end
