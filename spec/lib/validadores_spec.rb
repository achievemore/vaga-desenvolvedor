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
        skip("escreva testes para esses casos")
      end

      it "validador para data (DD/MM/YYYY)" do
        skip("escreva testes para esses casos")
      end
    end

    context "número" do
      it "validador número inteiro" do
        data = Validadores.valor('10')

        expect(data).to eq(true)
      end

      it "validador número decimal" do
        data = Validadores.valor('10,0')

        expect(data).to eq(true)
      end

      it "validador número percentual" do
        data = Validadores.valor('10%')

        expect(data).to eq(true)
      end

      it 'numero invalido' do
        data = Validadores.valor('abc')

        expect(data).to eq(false)
      end
    end

    context "diversos" do
      context  "validador e-mail" do
        it 'valid' do
          data = Validadores.email('teste@achievemore.com.br')

          expect(data).to eq(true)
        end
        it 'invalid' do
          data = Validadores.email('achievemore.com.br')

          expect(data).to eq(false)
        end
      end
    end
  end
end
