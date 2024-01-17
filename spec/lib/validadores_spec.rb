require 'rails_helper'
require 'validadores'

RSpec.describe Validadores, type: :lib do
  describe "Validadores" do
    context "data" do
      it "validador data (YYYY-MM-DD)" do
        data = Validadores.data('2019-02-28')

        expect(data).to eq(true)
      end

      it "validador data (YYYY-MM)" do
        data = Validadores.data('2019-02')

        expect(data).to eq(true)
      end

      it "validador para data (DD/MM/YYYY)" do
        data = Validadores.data('27/02/2019')

        expect(data).to eq(true)
      end
    end

    context "número" do
      it "validador número inteiro" do
        numero = Validadores.valor('15')

        expect(numero).to eq(true)
      end

      it "validador número decimal" do
        numero = Validadores.valor('10.5')

        expect(numero).to eq(true)
      end

      it "validador número percentual" do
        numero = Validadores.valor('25%')

        expect(numero).to eq(true)
      end
    end

    context "diversos" do
      it "validador e-mail" do
        email = Validadores.email('teste_test@achievemore.com')

        expect(email).to eq(true)
      end
    end
  end
end
