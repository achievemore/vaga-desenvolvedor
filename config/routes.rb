Rails.application.routes.draw do
  resources :clientes
  resources :resultados

  get :calculos, to: 'calculos#performance'
end
