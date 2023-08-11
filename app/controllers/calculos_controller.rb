require 'calculos'

class CalculosController < ApplicationController
  def performance
    valor_performance = Calculos.performance(params[:valor_meta], params[:valor_realizado])

    render json: { valor_performance: valor_performance }, status: :ok

  rescue Calculos::DivisaoInvalida
    render json: {}, status: :bad_request
  end
end
