class Calculos

  def self.performance(valor_meta, valor_realizado)
    if valor_meta == 0
      return 0
    elsif valor_meta.nil? then
      return nil
    elsif valor_realizado == 0
      return nil
    else
      valor_meta.to_f / valor_realizado.to_f #RETORNA 0,66777
      end
  end
end
