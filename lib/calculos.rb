class Calculos
  def self.performance(valor_meta, valor_realizado)
    return 0 if valor_meta.nil? || valor_realizado.nil? || valor_meta.zero? || valor_realizado.zero?

    (valor_realizado / valor_meta).round(2)
  end

  def self.realizado(valor_meta, valor_performance)
    return 0 if valor_meta.nil? || valor_performance.nil? || valor_meta.zero? || valor_performance.zero?

    (valor_performance * valor_meta).round(2)
  end
end
