class Calculos
  def self.performance(valor_meta, valor_realizado)
    if valor_meta > 0 && valor_realizado > 0
      (valor_realizado / valor_meta).round(2)
    else
      0
    end
  end
end
