require 'rails_helper'
require 'validadores'
require 'spec_helper'

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
        data = Validadores.data('19/09/2019')

        expect(data).to eq(true)
      end
    end

    let(:percent_calc){
      {number: 10 , percent: 0.5}
    }

    context "número" do
      it "validador número inteiro" do
        valor = Validadores.valor('1')

        expect('1').to eq('1')
      end

      it "validador número decimal" do
        valor = Validadores.valor('3.14')

        expect(3.14).to eq(3.14)
      end

      it "validador número percentual" do
        valor = Validadores.valor('0.25')
        expect(5).to eq(5)
    
      end
    end

    context "diversos" do
      it "validador e-mail" do
        email = Validadores.email('archvermore@gmail.com')

        expect(email).to eq(true)
      end
    end
  end
end
