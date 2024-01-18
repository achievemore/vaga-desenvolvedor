require 'rails_helper'
require 'calculos'

RSpec.describe Calculos, type: :lib do
  describe "Calcula performance" do
    it "com atributos validos" do
      valor_performance = Calculos.performance(100.5, 150.5)

      expect(valor_performance).to eq(1.5)
    end

    it "com valor realizado valido e meta zero" do
      valor_performance = Calculos.performance(0.0, 150.5)

      expect(valor_performance).to eq(0)
    end

    it "com valor realizado valido e meta null" do
      valor_performance = Calculos.performance(nil, 150.5)

      expect(valor_performance).to eq(0)
    end

    it "com valor meta valido e realizado zero" do
      valor_performance = Calculos.performance(50.0, 0)

      expect(valor_performance).to eq(0)
    end
  end

  describe "Calcula realizado" do
    it "com atributos validos" do
      valor_realizado = Calculos.realizado(100.5, 1.5)

      expect(valor_realizado).to eq(150.75)
    end

    it "com valor performance valido e meta zero" do
      valor_realizado = Calculos.realizado(0.0, 1.5)

      expect(valor_realizado).to eq(0)
    end

    it "com valor performance valido e meta null" do
      valor_realizado = Calculos.realizado(nil, 1.5)

      expect(valor_realizado).to eq(0)
    end

    it "com valor meta valido e performance zero" do
      valor_realizado = Calculos.realizado(100.0, 0)

      expect(valor_realizado).to eq(0)
    end
  end
end
