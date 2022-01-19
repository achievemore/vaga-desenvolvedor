require 'rails_helper'
require 'validadores'

RSpec.describe Validadores, type: :lib do
  describe "Validadores" do
    context "data" do
      it "validador data (YYYY-MM-DD)" do
        data = Validadores.data('2019-12-31')

        expect(data).to eq(true)
      end

      it "validador data (YYYY-MM)" do
        data = Validadores.data('2019-12')

        expect(data).to eq(true)
      end

      it "validador para data (DD/MM/YYYY)" do
        data = Validadores.data('31/12/2019')

        expect(data).to eq(true)
      end
    end

    context "número" do
      it "validador número inteiro" do
        valor = Validadores.valor('35')

        expect(valor).to eq(true)
      end

      it "validador número decimal" do
        valor = Validadores.valor('0.2')

        expect(valor).to eq(true)
      end

      it "validador número percentual" do
        valor = Validadores.valor('20%')

        expect(valor).to eq(true)
      end
    end

    context "diversos" do
      it "validador e-mail" do
        email = Validadores.email('teste@teste.com')

        expect(email).to eq(true)
      end
    end
  end
end
