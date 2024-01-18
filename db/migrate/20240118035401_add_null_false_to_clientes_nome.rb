class AddNullFalseToClientesNome < ActiveRecord::Migration[7.1]
  def change
    change_column_null :clientes, :nome, false
  end
end
