class Resultados
  attr_accessor :valor_meta, :valor_realizado, :valor_performance

  def initialize()
    @valor_meta = valor_meta
    @valor_realizado = valor_realizado
    @valor_performance = valor_performance
  end

  def calcula_performance
    return 0 if valor_meta == 0
    if valor_meta.present? and valor_realizado.present?
      valor_realizado.to_f / valor_meta.to_f
    end
  end

  def calcula_realizado
    return 0 if valor_realizado == 0
    if valor_meta.present? and valor_performance.present?
      valor_meta.to_f * valor_performance.to_f
    end
  end

  def calcula_meta
    return 0 if valor_meta == 0
    if valor_performance.present? and valor_realizado.present?
      valor_realizado.to_f * valor_performance.to_f
    end
  end
end
