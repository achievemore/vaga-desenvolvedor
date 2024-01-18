require 'calculos'
require 'bigdecimal'

class CalculosController < ApplicationController
  def performance
    valor_performance = Calculos.performance(BigDecimal(params[:valor_meta]), BigDecimal(params[:valor_realizado]))

    render json: { valor_performance: valor_performance }
  end
end
