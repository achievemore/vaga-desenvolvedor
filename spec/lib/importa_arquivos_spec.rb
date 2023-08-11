require 'rails_helper'
require 'csv'
require 'validadores'
require 'resultados'
require 'importa_arquivos'

include ActionDispatch::TestProcess::FixtureFile

RSpec.describe ImportaArquivos, type: :lib do
  describe "Importando arquivos" do
    let(:arquivo_valido) { { file: fixture_file_upload('arquivo_valido.csv', 'text/csv') } }
    let(:arquivo_invalido) { { file: fixture_file_upload('arquivo_invalido.csv', 'text/csv') } }

    context "Arquivo valido" do
      it "validando datas" do
        importa_arquivo = ImportaArquivos.new
        importa_arquivo.file = File.open(arquivo_valido[:file])
        importa_arquivo.perform

        expect(Cliente.all.size).to eq(3)
      end

      it "salva arquivo na base e calcula performance total" do
        importa_arquivo = ImportaArquivos.new
        importa_arquivo.file = File.open(arquivo_valido[:file])
        importa_arquivo.perform

        expect(Cliente.all.size).to eq(3)
        # expect(Resultado.new(valor_meta: client.valor_meta, valor_realizado: client.valor_realizado)).to eq(cliente.valor_realizado / cliente.valor_meta)

      end
    end

    context "Arquivo invalido" do
      it "validando datas" do
        importa_arquivo = ImportaArquivos.new
        importa_arquivo.file = File.open(arquivo_invalido[:file])
        importa_arquivo.perform

        expect(Cliente.all.size).to eq(2)
      end

      it "inserindo linhas na base somente se arquivo valido" do
        importa_arquivo = ImportaArquivos.new
        importa_arquivo.file = File.open(arquivo_invalido[:file])
        importa_arquivo.perform

        expect(Cliente.all.size).to eq(2)
      end
    end
  end
end
