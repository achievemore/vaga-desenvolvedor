class Calculos
  def self.performance(valor_meta, valor_realizado)
    valor = (valor_realizado.to_f / valor_meta.to_f)
    valor.to_s == 'Infinity' ? 0 : valor
  end
end
