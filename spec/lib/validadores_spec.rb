require 'rails_helper'
require 'validadores'
require 'spec_helper'

RSpec.describe Validadores, type: :lib do
  describe "Validadores" do
    context "data" do
      it "validador data (YYYY-MM-DD)" do
        data = Validadores.data('2019-31-12')

        expect(data).to eq(true)
      end

      it "validador data (YYYY-MM)" do
        data = Validadores.data('2019-31')

        expect(data).to eq(true)

      end

      it "validador para data (DD/MM/YYYY)" do
        data = Validadores.data('12-31-2019')

        expect(data).to eq(true)
      end
    end

    context "número" do
      it "validador número inteiro" do
        valor = Validadores.valor('1')

        expect(int).to eq('1')
      end

      it "validador número decimal" do
        valor = Validadores.valor('3.14')

        expect(float).to eq('3.14')
      end

      it "validador número percentual" do
        valor = Validadores.valor('0.25')

        expect(number*percent).should_be eq('25%')
      end
    end

    context "diversos" do
      it "validador e-mail" do
        email = Validadores.email('archvermore@gmail.com')

        expect(email).to eq('archvemore@gmail.com')
      end
    end
  end
end
