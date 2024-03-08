require 'rails_helper'
require 'validadores'

RSpec.describe Validadores, type: :lib do
  describe "Validadores" do
    context "data" do
      it "válida em formato (YYYY-MM-DD)" do
        data = Validadores.data('2019-12-31')

        expect(data).to eq(true)
      end

      it "válida em formato (YYYY-MM)" do
        data = Validadores.data('2019-12')

        expect(data).to eq(true)
      end

      it "válida em formato (YYYY/MM/DD)" do
        data = Validadores.data('2019/12/31')

        expect(data).to eq(true)
      end

      it "válida em formato (YYYY/MM)" do
        data = Validadores.data('2019/12')

        expect(data).to eq(true)
      end

      it "válida em formato (DD-MM-YYYY)" do
        data = Validadores.data('31-12-2019')

        expect(data).to eq(true)
      end

      it "válida em formato (MM-YYYY)" do
        data = Validadores.data('12-2019')

        expect(data).to eq(true)
      end

      it "válida em formato (DD/MM/YYYY)" do
        data = Validadores.data('31/12/2019')

        expect(data).to eq(true)
      end

      it "válida em formato (MM/YYYY)" do
        data = Validadores.data('12/2019')

        expect(data).to eq(true)
      end
    end

    context "número" do
      it "inteiro" do
        numero = Validadores.valor('40')

        expect(numero).to eq(true)
      end

      it "decimal com '.'" do
        numero = Validadores.valor('13.05054654654')

        expect(numero).to eq(true)
      end

      it "decimal com ','" do
        numero = Validadores.valor('13.05054654654')

        expect(numero).to eq(true)
      end

      it "percentual com '.'" do
        numero = Validadores.valor('98.93%')

        expect(numero).to eq(true)
      end

      it "percentual com ','" do
        numero = Validadores.valor('98,93%')

        expect(numero).to eq(true)
      end
    end

    context "email" do
      it "válido" do
        email = Validadores.email('email.exemplo')

        expect(email).to eq(false)
      end

      it "inválido" do
        email = Validadores.email('teste.exemplo@gmail.com')

        expect(email).to eq(true)
      end
    end
  end
end
