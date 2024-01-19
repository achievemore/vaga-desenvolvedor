class CalculosController < ApplicationController
  def performance
    valor_performance = Calculos.performance(calculos_params[:valor_meta], calculos_params[:valor_realizado])

    render json: { valor_performance: valor_performance }
  end

  private

  def calculos_params
    params.permit(:valor_meta, :valor_realizado)
  end
end
