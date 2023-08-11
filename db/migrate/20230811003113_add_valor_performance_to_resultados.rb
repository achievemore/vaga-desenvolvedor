class AddValorPerformanceToResultados < ActiveRecord::Migration[5.2]
  def change
    add_column :resultados, :valor_performance, :decimal, precision: 10, scale: 2
  end
end
