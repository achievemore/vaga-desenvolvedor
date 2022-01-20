class Resultados
  attr_accessor :valor_meta, :valor_realizado, :valor_performance

  def initialize()
    @valor_meta = valor_meta
    @valor_realizado = valor_realizado
    @valor_performance = valor_performance
  end

  def calcula_performance
    if valor_meta == 0
      return 0
    elsif valor_meta.nil?
      return nil
    else
      valor_realizado / valor_meta
    end
  end

  def calcula_realizado
    # return 0 if valor_realizado.zero?
    valor_meta * valor_performance
  end

end
