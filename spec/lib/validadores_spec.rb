require 'validadores'

RSpec.describe Validadores, type: :lib do
  describe "Validadores" do
    context "periodo" do
      it "validador para o formato YYYYMM" do
        periodo = Validadores.match_periodo('201912')

        expect(periodo).to eq(Date.new(2019, 12, 1))
      end

      it "validador para o formato YYYY-mm" do
        periodo = Validadores.match_periodo('2019-12')

        expect(periodo).to eq(Date.new(2019, 12, 1))
      end

      it "validador para o formato DD/MM/YYYY" do
        periodo = Validadores.match_periodo('12/12/2019')

        expect(periodo).to be_nil
      end

      it "validador para o formato DD-MM-YYYY" do
        periodo = Validadores.match_periodo('12-12-2019')

        expect(periodo).to be_nil
      end
    end

    context "data" do
      it "validador data (YYYY-MM-DD)" do
        data = Validadores.data('2019-12-12')

        expect(data).to eq(true)
      end

      it "validador data (YYYY-MM)" do
        data = Validadores.data('2019-12')

        expect(data).to eq(false)
      end

      it "validador para data (DD/MM/YYYY)" do
        data = Validadores.data('01-12-2019')

        expect(data).to eq(false)
      end
    end

    context "número" do
      it "validador número inteiro" do
        inteiro = Validadores.valor('20')

        expect(inteiro).to eq(true)
      end

      it "validador número decimal" do
        decimal = Validadores.valor('20.5')

        expect(decimal).to eq(true)
      end

      it "validador número percentual" do
        percentual = Validadores.valor('20%')

        expect(percentual).to eq(true)
      end
    end

    context "diversos" do
      it "validador e-mail errado" do
        errado = Validadores.email('email.text')

        expect(errado).to eq(false)
      end

      it "validador e-mail correto" do
        valido = Validadores.email('email@gmail.com')

        expect(valido).to eq(true)
      end
    end
  end
end
