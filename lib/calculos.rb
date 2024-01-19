class Calculos
  def self.performance(valor_meta, valor_realizado)
    return 0 if valor_meta.to_i.zero?

    (BigDecimal(valor_realizado, 9) / BigDecimal(valor_meta, 9)).to_f
  end
end
