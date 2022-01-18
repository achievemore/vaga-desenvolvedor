class Calculos

  def self.performance(valor_meta, valor_realizado)

  if valor_meta == 0
      return 0
  else
    valor_realizado.to_f / valor_meta.to_f
    end
  end
end


# valor_realizado=150,5
# valor_meta=100,50
