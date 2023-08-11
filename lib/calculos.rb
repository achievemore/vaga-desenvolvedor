class Calculos
  def self.performance(valor_meta, valor_realizado)
    return 0 if valor_meta.nil? || valor_realizado.nil?

    valor_realizado = valor_realizado.to_f
    valor_meta = valor_meta.to_f
    return 0 if valor_meta.zero? || valor_realizado.zero?

    (valor_realizado / valor_meta)
  end
end
