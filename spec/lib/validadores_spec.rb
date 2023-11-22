require 'rails_helper'
require 'validadores'

RSpec.describe Validadores, type: :lib do
  describe "Validadores" do
    context "data" do
      it "validador data (YYYY-MM-DD)" do
        data = described_class.data('2019-12-31')
        expect(data).to eq(true) 
      end

      it "validador data (YYYY-MM)" do
        data = described_class.data('2019-10')
        expect(data).to eq(true) 
      end

      it "validador para data (DD/MM/YYYY)" do
        data = described_class.data('31/12/2019')
        expect(data).to eq(true) 
      end
    end

    context "número" do
      it "validador número inteiro" do
        numero = described_class.valor("10")
        expect(numero).to eq(true) 
      end

      it "validador número decimal" do
        numero = described_class.valor("0.10")
        expect(numero).to eq(true) 
      end

      it "validador número percentual" do
        numero = described_class.valor("0.10")
        expect(numero).to eq(true) 
      end
    end

    context "diversos" do
      it "validador e-mail" do
        email = described_class.email("marcos@email.com")
        expect(email).to eq(true)     
      end
    end
  end
end
