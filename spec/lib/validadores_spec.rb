require 'rails_helper'
require 'validadores'

RSpec.describe Validadores, type: :lib do
  describe "Validadores" do
    context "data" do
      it "validador data (YYYY-MM-DD)" do
        data = Validadores.data('2019-31-12')

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
        data = Validadores.valor('9')

        expect(data).to eq(true)
      end

      it "validador número decimal" do
        data = Validadores.valor('0.7')

        expect(data).to eq(true)
      end

      it "validador número percentual" do
        data = Validadores.valor('11%')

        expect(data).to eq(true)
      end
    end

    context "diversos" do
      it "validador e-mail" do
        email = Validadores.email('g.zeldine@gmail.com')

        expect(email).to eq(true)
      end
    end
  end
end
