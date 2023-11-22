class Resultados
  attr_accessor :valor_meta, :valor_realizado, :valor_performance

  def calcula_performance
    return 0 if valor_meta.to_f.zero?
    valor_realizado.to_f / valor_meta.to_f
  end

  def calcula_realizado
    return 0 if valor_realizado.to_f.zero?

    valor_meta.to_f * valor_performance.to_f
  end
end
