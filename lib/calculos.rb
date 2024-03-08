class Calculos
  def self.performance(valor_meta, valor_realizado)
    return 0 if valor_meta.to_i.zero?
    (BigDecimal(valor_realizado.to_s) / BigDecimal(valor_meta.to_s)).round(15).to_f
  end
end
