require 'rails_helper'
require 'calculos'

RSpec.describe Calculos, type: :lib do
  describe "Calcula performance" do
    it "com atributos validos" do
      valor_performance = Calculos.performance(100.5, 150.5)

      expect(valor_performance).to eq(1.1682242990654206)
    end

    it "com valor realizado valido e meta zero" do
      valor_performance = Calculos.performance(150.5, 0)

      expect(valor_performance).to eq(valor_realizado)
    end

    it "com valor realizado valido e meta null" do
      valor_performance = Calculos.performance(150.5, null)

      expect(valor_performance).to eq(null)
      # skip("escreva testes para esses casos")
    end

    it "com valor meta valido e realizado zero" do
      valor_performance = Calculos.performance(150.5, 0.0)

      expect(valor_performance).to eq(0)
      # skip("escreva testes para esses casos")
    end
  end
end
