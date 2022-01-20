class Resultados
  attr_accessor :valor_meta, :valor_realizado, :valor_performance

  def initialize()
    @valor_meta = valor_meta
    @valor_realizado = valor_realizado
    @valor_performance = valor_performance
  end

  def calcula_performance
    if valor_meta == 0
      0
    elsif valor_meta.nil?
      nil
    else
      valor_realizado / valor_meta
    end
  end

  def calcula_realizado
    valor_meta * valor_performance
  end
end
