require 'csv'

include ActionDispatch::TestProcess::FixtureFile

RSpec.describe ImportaArquivos, type: :lib do
  describe "Importando arquivos" do
    let(:arquivo_valido) { { file: fixture_file_upload('arquivo_valido.csv', 'text/csv') } }
    let(:arquivo_invalido) { { file: fixture_file_upload('arquivo_invalido.csv', 'text/csv') } }

    context "Arquivo valido" do
      it "validando datas" do
        @file = File.open(arquivo_valido[:file])

        ImportaArquivos.importa_arquivo(@file)

        expect(Cliente.all.size).to eq(3)
      end

      it "salva arquivo na base e calcula performance total" do
        @file = File.open(arquivo_valido[:file])

        ImportaArquivos.importa_arquivo(@file)

        expect(Resultado.all.size).to eq(3)
      end
    end

    context "Arquivo invalido" do
      it "validando datas" do
        @file = File.open(arquivo_invalido[:file])

        expect do
          ImportaArquivos.importa_arquivo(@file)
        end.to change(Resultado, :count).by(1)
      end

      it "inserindo linhas na base somente se arquivo valido" do
        @file = File.open(arquivo_invalido[:file])
        expect do
          ImportaArquivos.importa_arquivo(@file)
        end.to change(Resultado, :count).by(1)
      end
    end
  end
end
