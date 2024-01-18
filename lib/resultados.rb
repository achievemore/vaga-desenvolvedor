class Resultados
  attr_accessor :valor_meta, :valor_realizado, :valor_performance

  def initialize()
    @valor_meta = valor_meta
    @valor_realizado = valor_realizado
    @valor_performance = valor_performance
  end

  def calcula_performance
    return 0 if invalido_valor_meta?

    valor_realizado / valor_meta
  end

  def calcula_realizado
    return 0 if invalido_valor_performance?
    return 0 if invalido_valor_meta?

    valor_meta * valor_performance
  end

  private

  def invalido_valor_performance?
    valor_performance.nil? || valor_performance.zero?
  end

  def invalido_valor_meta?
    valor_meta.nil? || valor_meta.zero?
  end
end
