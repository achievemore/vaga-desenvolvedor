class AddNullFalseToResultados < ActiveRecord::Migration[7.1]
  def change
    change_column_null :resultados, :periodo, false
    change_column_null :resultados, :valor_meta, false
    change_column_null :resultados, :valor_realizado, false
  end
end
