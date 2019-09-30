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
        data = Validadores.match_periodo('2019-12')

        expect(data).to eq(data.to_date)
      end

      it "validador para data (DD/MM/YYYY)" do
        data = Validadores.valid_data('18/11/2000')

        expect(data).to eq("18/11/2000")
      end

      it "validador para data (DD-MM-YYYY)" do
        data = Validadores.valid_data('18-11-2000')

        expect(data).to eq("18/11/2000")
      end
    end

    context "número" do
      it "validador número inteiro" do
        numero = Validadores.valor("1")

        expect(numero).to eq(true)
      end

      it "validador número decimal" do
        numero = Validadores.valor("2,2")

        expect(numero).to eq(true)
      end

      it "validador número percentual" do
        numero = Validadores.valor("%3")

        expect(numero).to eq(true)
      end
    end

    context "e-mail" do
      it "e-mail válido" do
        email = Validadores.email("giselle@achievemore.com")

        expect(email).to eq(true)
      end

      it "e-mail é inválido" do
        email = Validadores.email("achievemore.com")

        expect(email).to eq(false)
      end
    end
  end
end
