class Calculos
  class DivisaoInvalida < StandardError; end

  def self.performance(valor_meta, valor_realizado)
    (BigDecimal(valor_realizado) / BigDecimal(valor_meta)).tap do |valor|
      raise DivisaoInvalida if valor.to_s == 'Infinity'
    end
  end
end
