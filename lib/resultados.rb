class Resultados
  attr_accessor :valor_meta, :valor_realizado, :valor_performance

  def initialize()
    @valor_meta = valor_meta
    @valor_realizado = valor_realizado
    @valor_performance = valor_performance
  end

  def calcula_performance
    Calculos.performance(valor_meta,valor_realizado)
  end

  def calcula_realizado
    Calculos.realizado(valor_meta, valor_performance)
  end
end
